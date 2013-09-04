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
      flash[:success] = 'Votre message a ete envoye avec succes. Nous tacherons de vous repondre dans les plus brefs delais'
      redirect_to root_path
    else
      render "contact"
    end
  end

end
