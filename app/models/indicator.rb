class Indicator < ActiveRecord::Base

	# Relationships
	# --------------------------------
	belongs_to :competency
	has_many :indicator_resources
	has_many :resources, through: :indicator_resources

	# Validations
	# --------------------------------
	validates_presence_of :competency_id, :level, :description
	validates_numericality_of :competency_id, only_integer: true


	# Scopes
	# --------------------------------
	scope :alphabetical, -> { order('description') }
	scope :by_level, -> (level) { where("level LIKE ?", level) }
	scope :by_competency, -> (competency) { joins(:competency).where("competency.name LIKE ?", competency) }


	# Methods
	# --------------------------------



end
