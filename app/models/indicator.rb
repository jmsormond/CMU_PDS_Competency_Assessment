class Indicator < ActiveRecord::Base
    # The leves are hard coded because the client has confirmed that there
    # are only these three levels.
	LEVELS_LIST = ["Companion", "Contributor", "Champion"]

	# Relationships
	# --------------------------------
	belongs_to :competency
	has_many :indicator_resources
	has_many :resources, through: :indicator_resources
	accepts_nested_attributes_for :indicator_resources

	# Validations
	# --------------------------------
	validates_presence_of :competency_id, :level, :description
	validates_numericality_of :competency_id, only_integer: true


	# Scopes
	# --------------------------------
	scope :alphabetical, -> { order('description') }
	scope :by_level, -> (level) { where("level LIKE ?", level) }
	scope :by_description, -> (desc) { where("description LIKE ?", desc) }
	scope :by_competency, -> (competency) { joins(:competency).where("name LIKE ?", competency) }
	scope :active, -> { where(active: true) }

	# Private Methods
	# --------------------------------

    # This method is used by Filterrific for resources and questions
	def self.options_for_sort_by_level
        levels = Indicator.all.group(:id, :level).map { |e| e.level }
        options = Array.new
        levels.each do |level|
        	if !options.include?([level, level])
        		options.push([level, level])
        	end
        end
        return options
    end

end
