class FeedbacksController < ApplicationController
  def create
    @feedback = Feedback.new(feedback_params)
    flash.alert = @feedback.save ? 'Feedback received' : 'Cannot be empty'
  end

  private

  def feedback_params
    params.require(:feedback).permit(:username, :comment)
  end
end
