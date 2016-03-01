ENV["RAILS_ENV"] ||= "test"
require File.expand_path('../../config/environment', __FILE__)
require 'rails/test_help'
require 'simplecov'
SimpleCov.start 'rails'
require 'turn/autorun'


class ActiveSupport::TestCase
  ActiveRecord::Migration.check_pending!

  # Setup all fixtures in test/fixtures/*.yml for all tests in alphabetical order.
  #
  # Note: You'll currently still have to declare fixtures explicitly in integration tests
  # -- they do not yet inherit this setting
  # fixtures :all

  # Add more helper methods to be used by all tests here...
  Turn.config.format = :outline

  # ----------------------------------------------------
  # THIS HELPER METHOD IS NOT A DEFAULT METHOD IN RAILS
  def deny(condition)
    # a simple transformation to increase readability IMO
    assert !condition
  end

  # ----------------------------------------------------
  # CREATE_ & REMOVE_CONTEXT HELPER METHODS NOT DEFAULT METHODS IN RAILS (added in by J.H,)
  def create_context
    # Create three indicators
    @indicator1 = FactoryGirl.create(:indicator)
    @indicator2 = FactoryGirl.create(:indicator, description: "Able to present written communication in an easy–to-read format.")
    @indicator3 = FactoryGirl.create(:category, level: "Champion", description: "Engages in difficult conversations with others while maintaining respect.")
  end
  
  def remove_context
    @indicator1.destroy
    @indicator2.destory
    @indicator3.destroy
  end


end
