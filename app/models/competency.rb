class Competency < ActiveRecord::Base
    # relationshis
    has_many :indicators
    accepts_nested_attributes_for :indicators, reject_if: lambda { |indicator| indicator[:name].blank? }, allow_destroy: true
    
    cattr_accessor :form_steps do
    	%w(indicators resources verify)
    end

    attr_accessor :form_step

    # validations
    validates_presence_of :name

    # scopes
    scope :active, -> { where("active = ?", true) }
    scope :inactive, -> { where("active = ?", false) }
    scope :alphabetical, -> { order("name") }

  	def required_for_step?(step)
      return true if form_step.nil?
      return true if self.form_steps.index(step.to_s) <= self.form_steps.index(form_step)
  	end

end