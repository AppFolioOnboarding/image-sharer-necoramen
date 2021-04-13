module PageObjects
  module Feedbacks
    class FeedbackPage < PageObjects::Document
      path :new_image
      path :images
      path :image

      element :username_input, locator: '#feedback-username'
      element :comment_input, locator: '#feedback-comment'
      element :alert, locator: '.js-flash-alert'

      def post_feedback!(username: nil, comment: nil)
        username_input.set(username) if username
        comment_input.set(comment) if comment
        node.click_on('Submit')
        window.change_to(FeedbackPage)
      end

      def feedback_messages
        node.all('.js-feedback-message').map(&:text)
      end
    end
  end
end
