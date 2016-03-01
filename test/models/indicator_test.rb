require 'test_helper'

class IndicatorTest < ActiveSupport::TestCase

  # Using Shoulda's ActiveRecord matchers
  # Relationship macros
  should belong_to(:competency)
  should have_many(:indicator_resources)
  should have_many(:resources).through(:indicator_resources)

  # Validation macros
  should validate_presence_of(:competency_id)
  should validate_presence_of(:level)
  should validate_presence_of(:description)



  
  # context "With a proper context, " do
  #   # I can create the objects I want with factories
  #   setup do
  #     create_context
  #   end

  #   # and provide a teardown method as well
  #   teardown do
  #     remove_context
  #   end

  #   # test each factory object (not necessary, could be done in console)
  #   should "show that all factory objects are properly created" do
  #     # assert_equal "Ruby", @ruby.name
  #     # assert_equal "Rails", @rails.name
  #     # assert_equal "Testing", @testing.name
  #     # assert_equal "Black, David", @dblack.name
  #     # assert_equal "Hartl, Michael", @michael.name
  #     # assert_equal "Hellesoy, Aslak", @aslak.name
  #     # assert_equal "Chelimsky, David", @dchel.name
  #     # assert_equal "The Well-Grounded Rubyist", @wgr.title
  #     # assert_equal "Rails 3 Tutorial", @r3t.title
  #     # assert_equal "Ruby for Masters", @rfm.title
  #     # assert_equal "The RSpec Book", @rspec.title
  #     # assert_equal "Black, David", @wgr.authors.first.name
  #     # assert_equal "Hartl, Michael", @r3t.authors.first.name
  #     # assert_equal 2, @rspec.authors.size
  #     # assert_equal "Chelimsky, David", @rspec.authors.alphabetical.first.name
  #     # assert_equal "Black, David", @rfm.authors.first.name
  #     # assert_nil @agt.contract_date
  #     # assert_nil @rfm.published_date
  #   end


  #   # TESTING SCOPES
  #   #
  #   # Avaliable Indicator scopes
  #   #   - alphabetical
  #   #   - by_level
  #   #   - by_competency
    
  #   should "have all the books listed alphabetically by title" do
  #     # test code goes here...
  #   end
    

  # end
end
