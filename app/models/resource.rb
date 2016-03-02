class Resource < ActiveRecord::Base
	has_many :indicator_resources
	has_many :indicator, through: :indicator_resources

	# Scopes
    # -----------------------------
	scope :alphabetical, -> { order('name') }
	scope :active, -> { where(active: true) }
	scope :by_indicator, -> { joins(:indicator_resource.order('indicator_resource.indicator_id') }

    # Validations
    # -----------------------------
    validates_presence_of :type, :description
    validates_format_of :link, with: /(https?:\/\/(?:www\.|(?!www))[^\s\.]+\.[^\s]{2,}|www\.[^\s]+\.[^\s]{2,})/, message: "is not a valid format"

end
