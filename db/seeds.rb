# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'roo'
xlsx = Roo::Excelx.new(Rails.root.join('public', 'no_fact_no_vote.xlsx'))

case Rails.env
when "development"
  #1. 지역구 만들기
  i = 2
  while i < 20 do
    District.where(name: xlsx.sheet(0).row(i)[2]).first_or_create
    i += 1
  end

  #2. 유저 만들기
  n = 2
  while n < 10 do
    User.create!(name: xlsx.sheet(0).row(n)[0], party: xlsx.sheet(0).row(n)[1], district: District.find_by(name: xlsx.sheet(0).row(n)[2]), password: xlsx.sheet(0).row(n)[3], password_confirmation: xlsx.sheet(0).row(n)[4], image: Rails.root.join("public/seoul/#{n}.gif").open)
    n += 1
  end

  # User.create!(name: xlsx.sheet(0).row(2)[0], party: xlsx.sheet(0).row(2)[1], district: District.find_by(name: xlsx.sheet(0).row(2)[2]), password: xlsx.sheet(0).row(2)[3], password_confirmation: xlsx.sheet(0).row(2)[4])


when "production"
  AdminUser.update_attribute(password: 'sksrja11', password_confirmation: 'sksrja11')

  i = 2
  while i < 20 do
    District.where(name: xlsx.sheet(0).row(i)[2]).first_or_create
    i += 1
  end

  #2. 유저 만들기
  n = 2
  while n < 10 do
    User.create!(name: xlsx.sheet(0).row(n)[0], party: xlsx.sheet(0).row(n)[1], district: District.find_by(name: xlsx.sheet(0).row(n)[2]), password: xlsx.sheet(0).row(n)[3], password_confirmation: xlsx.sheet(0).row(n)[4], image: Rails.root.join("public/seoul/#{n}.gif").open)
    n += 1
  end
end
