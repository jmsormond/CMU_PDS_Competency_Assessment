class Competency < ActiveRecord::Base
    # relationshis
    has_many :indicators

    # validations
    validates_presence_of :name

    # scopes
    scope :active, -> { where("active = ?", true) }
    scope :inactive, -> { where("active = ?", false) }
    scope :alphabetical, -> { order("name") }
end