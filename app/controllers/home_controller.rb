class HomeController < ApplicationController

  def index
    if params[:keyword].present?
      @keyword = params[:keyword].gsub(/\s+/, "")

      @district = District.ransack(name_cont_any: @keyword).result(distinct: true)
      @district = District.find_by(id: @district)

      respond_to do |format|
        format.js
      end
    end
  end
end
