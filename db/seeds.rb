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
  while i < 30 do
    District.where(name: xlsx.sheet(0).row(i)[2]).first_or_create
    i += 1
  end

  #2. 유저 만들기
  n = 2
  while n < 60 do
    User.create!(name: xlsx.sheet(0).row(n)[0], party: xlsx.sheet(0).row(n)[1], district: District.find_by(name: xlsx.sheet(0).row(n)[2]), password: xlsx.sheet(0).row(n)[3], password_confirmation: xlsx.sheet(0).row(n)[4], policy: xlsx.sheet(0).row(n)[5], image: Rails.root.join("public/seoul/#{n}.gif").open, link1: xlsx.sheet(0).row(n)[6], link2: xlsx.sheet(0).row(n)[7], link3: xlsx.sheet(0).row(n)[8], link4: xlsx.sheet(0).row(n)[9])
    n += 1
  end

when "production"
  #1. 지역구 만들기
  i = 2
  while i < 25 do
    District.where(name: xlsx.sheet(0).row(i)[2]).first_or_create
    i += 1
  end

  #2. 유저 만들기
  n = 2
  while n < 25 do
    User.create!(name: xlsx.sheet(0).row(n)[0], party: xlsx.sheet(0).row(n)[1], district: District.find_by(name: xlsx.sheet(0).row(n)[2]), password: xlsx.sheet(0).row(n)[3], password_confirmation: xlsx.sheet(0).row(n)[4], small_district: xlsx.sheet(0).row(n)[5], policy: xlsx.sheet(0).row(n)[6], image: Rails.root.join("public/daegu/#{n}.gif").open, link1: xlsx.sheet(0).row(n)[7], link2: xlsx.sheet(0).row(n)[8], link3: xlsx.sheet(0).row(n)[9], link4: xlsx.sheet(0).row(n)[10], head1: xlsx.sheet(0).row(n)[11], head2: xlsx.sheet(0).row(n)[12], head3: xlsx.sheet(0).row(n)[13], head4: xlsx.sheet(0).row(n)[14])
    n += 1
  end
end
