class UserMailer < ActionMailer::Base
  def contact_me_email(name, email, message)
    @name = name
    @email = email
    @mesage = message

    mail(
        from: email,
        to: 'reedness3000@gmail.com',
        subject: 'Contact request'
      )
  end
end
