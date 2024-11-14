class ContactMailer < ActionMailer::Base
    default to: "info@chesnowitz.com"
   
    def contact_email(name, email, message)
    @name = name
    @email = email
    @message = message
   
    mail(from: email, subject: "Nadia's Articles Contact Form Message")
    end
   end