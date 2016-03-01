class Indicator < ActiveRecord::Base

	# Relationships
	# --------------------------------
	belongs_to :competency
	has_many :indicator_resources
	has_many :indicators, through: :indicator_resources

	# Validations
	# --------------------------------
	validates_presence_of :competency_id, :level, :description
	validates_numericality_of :competency_id, only_integer: true


	# Scopes
	# --------------------------------
	scope :alphabetical, -> { order('description') }
	scope :


	# Methods
	# --------------------------------



end
