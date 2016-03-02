
FactoryGirl.define do

  # Indicators factory set up
  factory :indicator do
    association :competency
    level "Companion"
    description "Able to identify common nonverbal cues."
    active true
  end

  factory :competency do
    name "Communication"
  end

end