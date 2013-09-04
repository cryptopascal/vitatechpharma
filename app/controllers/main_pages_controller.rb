class MainPagesController < ApplicationController
  def home
  end

  def about
  end

  def contact
    @contact = Contact.new
  end

  def sendMessage
    @contact = Contact.new(params[:contact])
    if @contact.valid?
      flash[:success] = 'Success'
      redirect to home_path
    else
      render action: "contact"
    end
  end

end
