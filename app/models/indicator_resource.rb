class IndicatorResource < ActiveRecord::Base
	attr_accessor :indicator_description
	belongs_to :resource
	belongs_to :indicator
	validates_presence_of :resource_id, :indicator_id

	def name
		return resource.name
	end
end
