require 'test_helper'

class IndicatorResourceTest < ActiveSupport::TestCase
  should belong_to(:resource)
  should belong_to(:indicator)
  should validate_presence_of(:resource_id)
  should validate_presence_of(:indicator_id)
end
