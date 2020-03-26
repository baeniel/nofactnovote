class District < ApplicationRecord
  has_many :users, dependent: :destroy
end
