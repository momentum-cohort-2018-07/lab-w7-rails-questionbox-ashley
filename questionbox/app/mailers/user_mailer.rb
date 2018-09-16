class UserMailer < ApplicationMailer

    # Subject can be set in your I18n file at config/locales/en.yml
    # with the following lookup:
    #
    #   en.user_mailer.signup.subject
    
    def newanswer(user)
      @user = user
      @greeting = "You have a new answer from QuestionBox!"
      mail(
        to: @user.email,
        from: 'awhitted4@gmail.com',
        subject: 'Answer from QuestionBox'
      )
    end
    def signup(user)
      @user = user
       
      @greeting = "Thank you for subscribing to QuestionBox! Your email address is #{@user.email}."
      mail(
        to: @user.email,
        from: 'awhitted4@gmail.com',
        subject: 'Welcome to QuestionBox!'
      )
    end
end