class Competency < ActiveRecord::Base
    # relationshis
    has_many :indicators

    # validations
    validate_presence_of :name
end
