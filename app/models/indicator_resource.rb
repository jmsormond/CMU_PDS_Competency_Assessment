class IndicatorResource < ActiveRecord::Base
	attr_accessor :indicator_description
	#Resource temp vars
	attr_accessor :uploaded_resource_name
	attr_accessor :resource_name
	attr_accessor :resource_description
	attr_accessor :resource_category
	attr_accessor :resource_link
	belongs_to :resource
	belongs_to :indicator
	validates_presence_of :resource_id, :indicator_id

	def name
		return resource.name
	end
end
