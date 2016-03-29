class IndicatorQuestion < ActiveRecord::Base
    #relationships
    belongs_to :question
    belongs_to :indicator

    #validations
    validates_presence_of :indicator_id, :resource_id
end
