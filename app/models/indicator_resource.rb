class IndicatorResource < ActiveRecord::Base
	has_one :resource
	has_one :indicator
	validates_presence_of :resource_id, :indicator_id
end
