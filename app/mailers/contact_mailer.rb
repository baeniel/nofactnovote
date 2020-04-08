class ContactMailer < ApplicationMailer
  def contact_me(contact)
    @body = contact.body
    @email = contact.email
    @congress_name = contact.congress_name
    @congress_party = contact.congress_party

    # Note: my actual email is here, I just omitted it for this question
    mail to: "no.fact.no.vote@gmail.com"
  end
end
