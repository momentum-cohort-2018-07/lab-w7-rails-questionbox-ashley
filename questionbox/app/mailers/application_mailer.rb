class ApplicationMailer < ActionMailer::Base
  default from: 'awhitted4@gmail.com'
  def sample_email(user)
    @user = user
    mail(to: @user.email, subject: 'You have a new answer from QuestionBox!')
  end
  
  layout 'mailer'
end
