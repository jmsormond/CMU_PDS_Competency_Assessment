class Resource < ActiveRecord::Base
	has_many :indicator_resources
	has_many :indicators, through: :indicator_resources

	# Scopes
    # -----------------------------
	scope :alphabetical, -> { order('name') }
	scope :active, -> { where(active: true) }
	scope :for_indicator, -> (indicator_id) { joins(:indicator_resources).where('indicator_id = ?', indicator_id) }
	scope :search, ->(term) { where('name LIKE ?', "#{term}%", "#{term}%") }

    # Validations
    # -----------------------------
    validates_presence_of :name, :type
    validates_format_of :link, with: /(https?:\/\/(?:www\.|(?!www))[^\s\.]+\.[^\s]{2,}|www\.[^\s]+\.[^\s]{2,})/, message: "is not a valid format", :allow_blank => true

end
