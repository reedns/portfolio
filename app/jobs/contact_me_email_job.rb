class ContactMeEmailJob
  include SuckerPunch::Job

  def perform(contact)
    UserMailer.contact_me_email(contact).deliver
  end
end
