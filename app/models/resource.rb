class Resource < ActiveRecord::Base
    # Gem for filtering
    filterrific(
        default_filter_params: { sorted_by: 'name asc' },
        available_filters: [
            :sorted_by,
            :sort_active,
            :sort_by_competency,
            :sort_by_level,
            :sort_by_category
        ]
    )

	has_many :indicator_resources
	has_many :indicators, through: :indicator_resources

	# Scopes
    # -----------------------------
	scope :alphabetical, -> { order('name') }
	scope :active, -> { where(active: true) }
    scope :inactive, -> { where(active: false) }
	scope :for_indicator, -> (indicator_id) { joins(:indicator_resources).where('indicator_id = ?', indicator_id) }
	scope :search, ->(term) { where('name LIKE ?', "#{term}%", "#{term}%") }
    # scopes for filterrific
    scope :sort_active, -> (query) { where('resources.active = ?', query) }
    scope :sort_by_category, -> (query) { where('resources.resource_category = ?', query) }
    scope :sort_by_level, -> (query) { joins(:indicators).where('indicators.level = ?', query) }
    scope :sort_by_competency, -> (query) {  joins(:indicators).joins("INNER JOIN competencies ON indicators.competency_id = competencies.id").where('competencies.name = ?', query) }
    scope :sorted_by, lambda { |sort_option|
      direction = (sort_option =~ /desc$/) ? 'desc' : 'asc'
      case sort_option.to_s
      when /^name/
        order("LOWER(resources.name) #{ direction }")
      when /^resource_category/
        order("LOWER(resources.resource_category) #{ direction }")
      else
        raise(ArgumentError, "Invalid sort option: #{ sort_option.inspect }")
      end
    }

    # Validations
    # -----------------------------
    validates_presence_of :name, :resource_category
    validates_format_of :link, with: /(https?:\/\/(?:www\.|(?!www))[^\s\.]+\.[^\s]{2,}|www\.[^\s]+\.[^\s]{2,})/, message: "is not a valid format", :allow_blank => true

    # Private Functions
    # -----------------------------

    def self.options_for_sorted_by
        [
          ['Name (a-z)', 'name asc'],
          ['Name (z-a)', 'name desc'],
          ['Type (a-z)', 'resource_category_desc'],
          ['Type (z-a)', 'resource_category_asc']
        ]
    end

    def self.options_for_sort_active
        [
            ["True", 't'],
            ["False", 'f']
        ]
    end

    def self.options_for_sort_by_category
        group(:resource_category).map { |e| [e.resource_category, e.resource_category] }
    end

end
