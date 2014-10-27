class UserMailer < ActionMailer::Base
  def contact_me_email(contact)
    @contact = contact

    mail(
        from: contact.email,
        to: 'reedness3000@gmail.com',
        subject: 'Contact request'
      )
  end
end
