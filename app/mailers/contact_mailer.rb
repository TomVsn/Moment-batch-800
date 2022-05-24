class ContactMailer < ApplicationMailer
  def contact_mail(contact)
    @contact = contact
    mail to: "myriam.delbreil@gmail.com", subject: "Contact Us"
  end
end
