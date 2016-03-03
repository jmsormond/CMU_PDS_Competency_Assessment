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

 	#Contexts

 	#Scope Test


end
