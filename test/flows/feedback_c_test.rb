require 'flow_test_helper'

class FeedbackCTest < FlowTestCase
  test 'submit an empty feedback and a valid feedback' do
    username = 'username1'
    comment = 'feedback message'
    feedback_page = PageObjects::Feedbacks::FeedbackPage.visit

    feedback_page = feedback_page.post_feedback!(username: username, comment: '')
    messages = feedback_page.feedback_messages
    assert_equal messages, ['Comment can\'t be blank']

    feedback_page = feedback_page.post_feedback!(username: username, comment: comment)
    messages = feedback_page.feedback_messages
    assert_equal messages, ['Feedback received']
  end
end
