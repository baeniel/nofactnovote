class ContactsController < ApplicationController
  def new

  end

  def create
    @contact = Contact.new
    @contact.email = params[:contact][:email]
    @contact.congress_name = params[:contact][:congress_name]
    @contact.congress_party = params[:contact][:congress_party]
    @contact.body = params[:contact][:body]
    @contact.save
    if @contact.valid?
      ContactMailer.contact_me(@contact).deliver_now!
      flash[:alert] = "제보해주셔서 감사합니다:)"
      redirect_back fallback_location: root_path
    end
  end

  private
  def contact_params
    params.require(:contact).permit(:title, :congress_name, :congress_party, :body)
  end
end
