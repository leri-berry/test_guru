class FeedbacksController < ApplicationController
  
  def new; end

  def create
    FeedbacksMailer.new_feedback(feedback_params, current_user).deliver_now
    redirect_to tests_path, notice: t('.success')
  end

  private

  def feedback_params
    params.permit(:subject, :feedback)
  end
end