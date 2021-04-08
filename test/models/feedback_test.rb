require 'test_helper'

class FeedbackTest < ActiveSupport::TestCase
  test 'successfully saves a non-empty comment' do
    assert_difference('Feedback.count', 1) do
      Feedback.create!(username: 'user1', comment: 'comment1')
    end
  end

  test 'does not save empty comments' do
    assert_no_difference('Feedback.count') do
      Feedback.create(username: 'user1', comment: '')
    end
  end
end
