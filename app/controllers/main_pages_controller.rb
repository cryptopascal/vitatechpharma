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
    if @contact.valid? && verify_recaptcha(model: @contact, message:"Oh! It's error with reCAPTCHA!")
      flash[:success] = 'Votre message a ete envoye avec succes. Nous tacherons de vous repondre dans les plus brefs delais'
      InformationNotifier.clientNotif(@contact).deliver
      InformationNotifier.adminNotif(@contact).deliver
      redirect_to root_path
    else
      flash.delete(:recaptcha_error)
      render "contact"
    end
  end

end
