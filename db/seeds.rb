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
  AdminUser.destroy_all
  AdminUser.create!(email: 'admin@example.com', password: 'password', password_confirmation: 'password')
when "production"
  AdminUser.destroy_all
  AdminUser.create!(email: 'admin@example.com', password: 'password', password_confirmation: 'password')
  # User.create!(name: xlsx.sheet(0).row(2)[0], party: xlsx.sheet(0).row(2)[1], district: District.find_by(name: xlsx.sheet(0).row(2)[2]), password: xlsx.sheet(0).row(2)[3], password_confirmation: xlsx.sheet(0).row(2)[4]) if Rails.env.production?
end
