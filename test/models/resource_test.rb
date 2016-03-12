require 'test_helper'

class ResourceTest < ActiveSupport::TestCase
	#Relationship Macros
	should have_many(:indicator_resources)
	should have_many(:indicators).through(:indicator_resources)

 	#Validation Macros
 	should validate_presence_of(:name)
 	should validate_presence_of(:type)

 	#Validate Name
 	should allow_value("Waltzing with Bears").for(:name)
 	should allow_value("Something: Something Else").for(:name)

 	#Validate Link
 	should allow_value("https://en.wikipedia.org/wiki/Master_of_Puppets").for(:link)
 	should allow_value("www.google.com").for(:link)
 	should allow_value("www.cmu.edu").for(:link)
 	should allow_value(nil).for(:link)
 	should_not allow_value("cmu.edu").for(:link)
 	should_not allow_value("oh my god").for(:link)
 	should_not allow_value(-2).for(:link)

 	#Validate Description
 	string desc1 = "A comprehensive guide for talking with new yorkers."
 	should allow_value(desc1).for(:description)
 	should_not allow_value(-2).for(:description)

 	#Contexts
 	Context "Create 3 resources" do
	 	#Set up contexts
	 	setup do
	 		@dundee = FactoryGirl.create(:resource)
	 		@bears = FactoryGirl.create(:resource, name:"Waltzing With Bears")
	 		@newyork = FactoryGirl.create(:resource, name:"Talking to New Yorkers")
	 		@irwin = FactoryGirl.create(:resource, name:"Steve Irwin: A Legacy", active:false)
	 	end

	 	#Tear down contexts
	 	teardown do
	 		@dundee.destroy
	 		@bears.destroy
	 		@newyork.destroy
	 		@irwin.destroy
	 	end

 		#Scope Test
 		should "show that there are 3 active resources" do
 			assert_equal 3, Resource.active.size
 		end

 		should "list resources in alphabetical order" do
 			assert_equal ["Crocodile Dundee", "Talking to New Yorkers", "Waltzing With Bears"], Owner.alphabetical.map{|o| o.name}
 		end

	end
#end of testing
end
