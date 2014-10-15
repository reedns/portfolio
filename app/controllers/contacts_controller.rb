class ContactsController < ApplicationController
  def create
    @contact = Contact.new

    if @contact.save
      ContactMeEmailJob.new.asyn.perform(@contact)
      redirect_to root_path, success: 'Your email has been sent!'
    else
      render 'welcome/index', error: 'Looks like you missed a field.'
    end
  end
end
