class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  belongs_to :district

  enum party: ["더불어", "자한당"]

  def email_required?
    false
  end
end
