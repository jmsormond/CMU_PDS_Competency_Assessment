require 'test_helper'

class IndicatorQuestionTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end

  # Relationship Macros
  should belong_to(:questions)
  should belong_to(:indicators)

  # Validation Macros
  should validate_presence_of(:indicator_id)
  should validate_presence_of(:question_id)
end
