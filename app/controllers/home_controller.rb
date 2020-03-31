# require 'roo'

class HomeController < ApplicationController

  def index
    # xlsx = Roo::Excelx.new(Rails.root.join('public', 'no_fact_no_vote.xlsx'))

    # District.find_by(name: xlsx.sheet(0).row(2)[2]
    # User.create(name: xlsx.sheet(0).row(2)[0], party: xlsx.sheet(0).row(2)[1], district: District.find_by(name: xlsx.sheet(0).row(2)[2]), password: xlsx.sheet(0).row(2)[3], password_confirmation: xlsx.sheet(0).row(2)[4])


    if params[:keyword].present?
      # byebug
      @keyword = params[:keyword].gsub(/\s+/, "")

      # @district = District.ransack(name_cont_any: @keyword).result(distinct: true)

      # @district = District.ransack(name_end_any: @keyword).result(distinct: true)
      @district = District.ransack(name_cont_any: @keyword).result(distinct: true)
      @district = District.find_by(id: @district)
      # byebug

      respond_to do |format|
        format.js
      end
    end
  end
end
