class MainPagesController < ApplicationController
  def home
    @newsletter = Newsletter.new
  end

  def about
  end

  def contact
    @contact = Contact.new
  end



  def addToNewsletter
    @newsletter = Newsletter.new(params[:newsletter])
    if @newsletter.valid?
      @newsletter.save()
      flash[:success] = 'Votre inscription est prise en compte'
      redirect_to root_path
    else
      render "home"
    end
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
