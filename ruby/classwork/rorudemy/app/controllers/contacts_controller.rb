class ContactsController < ApplicationController
  def new
    @contact = Contact.new
  end

  def create
    @contact = Contact.new(contact_params)

    if @contact.save
      redirect_to root_path
      # Get the contact details
      name = params[:contact][:name]
      email = params[:contact][:email]
      message = params[:contact][:message]

      # Send the email
      ContactMailer.contact_email(name, email, message).deliver

      # Show success message and redirect
      flash[:success] = "Thanks for the message, we will be in touch soon."
      
    else
      redirect_to pages_contact_path
      # Show error message and redirect
      flash[:danger] = "Oops, there was a problem! Please fill out all the fields."
      
    end
  end

  private
  def contact_params
    params.expect(contact: [:name, :email, :message])
  end
end
