class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  belongs_to :district

  mount_uploader :image, ImageUploader

  enum party: ["더불어민주당", "미래통합당", "민생당"]

  def image_url
    image.url.present? ? image.url(:square) : '/applet-touch-icon.png'
  end

  def email_required?
    false
  end
end
