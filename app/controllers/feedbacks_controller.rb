class FeedbacksController < ApplicationController
  def create
    @feedback = Feedback.new(feedback_params)
    if @feedback.save
      render json: { message: 'Feedback received' }
    else
      render json: { message: @feedback.errors.full_messages }
    end
  end

  private

  def feedback_params
    params.require(:feedback).permit(:username, :comment)
  end
end
