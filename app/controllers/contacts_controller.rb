class ContactsController < ApplicationController
  def index
    @contacts = Contact.all
  end

  def new
    @contact = Contact.new
  end

  def create
    @contact = Contact.new contact_params
    if @contact.save
      redirect_to root_path, :notice => "Saved contact #{@contact.first_name} #{@contact.last_name}"
    else
      render 'new'
    end
  end

  private

  def contact_params
    params.require(:contact).permit(:first_name, :last_name, :email)
  end
end
