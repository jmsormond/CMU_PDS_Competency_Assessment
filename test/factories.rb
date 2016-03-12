<<<<<<< HEAD

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

=======
FactoryGirl.define do
    #competencies
    factory :competency do
        name "Communication"
        active true
    end

	factory :resource do
		name "Crocodile Dundee"
		type "MOVIE"
		description "Crocodile Dundee is a 1986 Australian comedy film set in the Australian Outback and in New York City."
		link "https://en.wikipedia.org/wiki/%22Crocodile%22_Dundee"
		active true
	end

	factory :resource_inicator do
		association :resource
		association :indicator
	end
>>>>>>> master
end