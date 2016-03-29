class Question < ActiveRecord::Base
    #relationships
    has_many :indicator_questions
    has_many :indicators, through: :indicator_questions

    #validations
    validates_presence_of :question

    #scoeps
    scope :active, -> { where("active = ?", true) }
    scope :inactive, -> { where("active = ?", false) }
    scope :alphabetical, -> { order("question") }
end
