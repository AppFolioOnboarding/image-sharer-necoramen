require 'test_helper'

class FeedbacksControllerTest < ActionDispatch::IntegrationTest
  test 'submit a feedback' do
    post '/api/feedbacks', params: { feedback: { username: 'user', comment: 'feedback message' } }
    assert_response :success
  end
end
