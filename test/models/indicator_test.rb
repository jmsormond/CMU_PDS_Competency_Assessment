require 'test_helper'

class IndicatorTest < ActiveSupport::TestCase

  # Using Shoulda's ActiveRecord matchers
  # Relationship macros
  should belong_to(:competency)
  should have_many(:resources).through(:indicator_resources)
  should have_many(:indicator_resources)

  # Validation macros
  should validate_presence_of(:competency_id)
  should validate_presence_of(:level)
  should validate_presence_of(:description)

  # Validation for competency_id
  # Competency_id field can only be an integer
  should allow_value(2).for(:competency_id)
  should_not allow_value("Fred").for(:competency_id)



  
  context "With a proper context, " do
    # I can create the objects I want with factories
    setup do
      create_context
    end

    # and provide a teardown method as well
    teardown do
      remove_context
    end

    # test each factory object (not necessary, could be done in console)
    should "show that all factory objects are properly created" do
      assert_equal "Able to identify common nonverbal cues.", @indicator1.description
      assert_equal "Companion", @indicator1.level

      # @TODO add more asserts here

    end


    # TESTING SCOPES
    #
    # Available Indicator scopes
    #   - alphabetical
    #   - by_level
    #   - by_competency
    #   - active
    
    should "have all the books listed alphabetically by title" do
      # @TODO test code goes here...
    end
    

  end
end
