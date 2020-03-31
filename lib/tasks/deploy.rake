# namespace :export do
#   desc "Prints Country.all in a seeds.rb way."
#   task :seeds_format => :environment do
#     Country.order(:id).all.each do |country|
#       puts "Country.create(#{country.serializable_hash.delete_if {|key, value| ['created_at','updated_at','id'].include?(key)}.to_s.gsub(/[{}]/,'')})"
#     end
#   end
# end

# namespace :deploy do
#   desc "reload the database with seed data"
#   task :seed do
#     run "cd #{current_path}; bundle exec rake db:seed RAILS_ENV=#{rails_env}"
#   end
# end

namespace :deploy do
  desc "reload the database with seed data"
  task :seed do
    puts "User.create!(name: xlsx.sheet(0).row(2)[0], party: xlsx.sheet(0).row(2)[1], district: District.find_by(name: xlsx.sheet(0).row(2)[2]), password: xlsx.sheet(0).row(2)[3], password_confirmation: xlsx.sheet(0).row(2)[4])"
    # run "cd #{current_path}; bundle exec rake db:seed RAILS_ENV=#{rails_env}"
  end
end
