class InformationNotifier < ActionMailer::Base
  default from: "contact@vitatechpharma.com"

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.information_notifier.clientNotif.subject
  #
  def clientNotif(contact)
     @contact = contact

     mail to: contact.email, subject: '[Notification]: ' << Vitatechpharma.config.site_name
  end

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.information_notifier.adminNotif.subject
  #
  def adminNotif(contact)
    @contact = contact

    mail to: "contact@vitatechpharma.com" , subject:'Notification: vous avez une nouveau message'
  end
end
