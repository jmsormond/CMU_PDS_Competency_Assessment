class IndicatorResource < ActiveRecord::Base
	belongs_to :resource
	belongs_to :indicator
	validates_presence_of :resource_id, :indicator_id
end
