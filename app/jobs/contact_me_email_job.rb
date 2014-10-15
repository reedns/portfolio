class ContactMeEmailJob
  include SuckerPunch::Job

  def perform(contact)
    UserMailer.contact_me_email(name, email, message).deliver
  end
end
