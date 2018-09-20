class UserMailer < ApplicationMailer

    # Subject can be set in your I18n file at config/locales/en.yml
    # with the following lookup:
    #
    #   en.user_mailer.signup.subject
    #
    def signup(user)
      @user = user
      @greeting = "Thanks for signing up! Your email address is #{@user.email}."
  
      mail(
        to: @user.email,
        from: 'from@example.com',
        subject: 'Welcome to QuestionBox!'
      )
    end
  
end