class Competency < ActiveRecord::Base
    # relationshis
    has_many :indicators

    # validations
    validates_presence_of :name
end
