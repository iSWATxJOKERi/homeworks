class UserMailer < ApplicationMailer
    default from: 'everybody@appacademy.io'

    def welcome_email(user)
        @user = user

        mail(to: cats_url, subject: 'Welcome to My Awesome Site')
    end
end
