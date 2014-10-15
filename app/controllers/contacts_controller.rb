class ContactsController < ApplicationController
  def create
    @contact = Contact.new(contact_params)

    if @contact.save
      ContactMeEmailJob.new.async.perform(@contact)
      redirect_to root_path, success: 'Your email has been sent!'
    else
      render 'welcome/index', error: 'Looks like you missed a field.'
    end
  end

  private

  def contact_params
    params.require(:contact).permit(:name, :email, :message)
  end
end
