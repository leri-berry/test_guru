class FeedbacksMailer < ApplicationMailer
  def new_feedback(feedback, user)
    @feedback = feedback[:feedback]
    @user = user
    mail to: admin_email, subject: "new feedback from #{@user.email}"
  end

  private

  def admin_email
    User.find_by(type: 'Admin').email
  end
end