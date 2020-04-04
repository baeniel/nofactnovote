class HomeController < ApplicationController

  def index
    if params[:keyword].present?
      @keyword = params[:keyword].gsub(/\s+/, "")

      @district = District.ransack(name_cont_any: @keyword).result(distinct: true)
      @district = District.find_by(id: @district)

      @congress = User.ransack(name_cont_any: @keyword).result(distinct: true)
      @congress = User.where(id: @congress)

      respond_to do |format|
        format.js
      end
    end

    if params[:user_id].present?
      @user = User.find(params[:user_id])
      @user.increment!(:visit, by=1)


    end
  end
end
