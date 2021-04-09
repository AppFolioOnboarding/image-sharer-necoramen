require 'flow_test_helper'

class FeedbackCTest < FlowTestCase
  test 'submit a feedback' do
    username = 'username1'
    comment = 'feedback message'
    index_page = PageObjects::Feedbacks::FeedbackPage.visit
    index_page.post_feedback!(username: username, comment: comment)

    feedback = Feedback.last
    assert_equal(feedback.username, username)
    assert_equal(feedback.comment, comment)
  end
end
