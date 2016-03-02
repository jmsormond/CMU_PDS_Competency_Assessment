class Resource < ActiveRecord::Base
	has_many :indicator_resources
	has_many :indicator, through: :indicator_resources

	scope :by_competency, -> { joins(:competency).order('competency.name') }

    # Validations
    # -----------------------------
    validates_presence_of :type, :description
    validates_format_of :link, with: /(https?:\/\/(?:www\.|(?!www))[^\s\.]+\.[^\s]{2,}|www\.[^\s]+\.[^\s]{2,})/, message: "is not a valid format"

end
