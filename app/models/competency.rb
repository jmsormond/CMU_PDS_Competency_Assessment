class Competency < ActiveRecord::Base
    # relationshis
    has_many :indicators
    has_many :resouce_indicators, through: :indicators
    accepts_nested_attributes_for :indicators
    accepts_nested_attributes_for :resouce_indicators

    # validations
    validates_presence_of :name

    # scopes
    scope :active, -> { where("active = ?", true) }
    scope :inactive, -> { where("active = ?", false) }
    scope :alphabetical, -> { order("name") }

    # Private Methods
    # ---------------------------

    def self.options_for_sort_by_competency
        all.map { |e| [e.name, e.name] }
    end

end