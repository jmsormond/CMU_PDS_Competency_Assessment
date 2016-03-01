
FactoryGirl.define do

  # Indicators factory set up
  factory :indicator do
    association :competency
    :level "Companion"
    :description "Able to identify common nonverbal cues."
  end

end