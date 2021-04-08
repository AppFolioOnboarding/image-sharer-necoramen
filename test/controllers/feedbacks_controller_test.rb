require 'test_helper'

class FeedbacksControllerTest < ActionDispatch::IntegrationTest
  test 'submit a nonempty feedback' do
    post '/api/feedbacks', params: { feedback: { username: 'user', comment: 'feedback message' } }
    assert_response :ok
  end

  test 'submit an empty feedback' do
    post '/api/feedbacks', params: { feedback: { username: 'user', comment: '' } }
    assert_response :ok
  end
end
