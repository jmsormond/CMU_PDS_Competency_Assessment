class Indicator < ActiveRecord::Base
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

	def self.options_for_sort_by_level
        group(:level).map { |e| [e.level, e.level] }
    end

end
