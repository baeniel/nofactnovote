require 'rubygems'
require 'rest_client'
require 'cgi'

class HomeController < ApplicationController

  def index
    if params[:keyword].present?
      @keyword = params[:keyword].gsub(/\s+/, "")

      @district = District.ransack(name_cont: @keyword).result(distinct: true)
      @district = District.find_by(id: @district)

      @congress = User.ransack(name_cont_any: @keyword).result(distinct: true)
      @congress = User.where(id: @congress)

      respond_to do |format|
        format.js
      end
    end

    # url = 'http://apis.data.go.kr/9760000/CommonCodeService/getCommonSggCodeList'
    # headers = { :params => { CGI::escape('ServiceKey') => 'pBCDhUSP1lJ77BU58EJBQUlcKirh4gX1ap427Pya5Jws%2FsBX7jKtz4IwOuB12v0W%2FVN8MM%2B0Yl%2FuOxXnvJFdpA%3D%3D',CGI::escape('ServiceKey') => '-',CGI::escape('pageNo') => '1',CGI::escape('numOfRows') => '10',CGI::escape('sgId') => '20200415',CGI::escape('sgTypecode') => '2' } }
    # response = RestClient::Request.execute :method => 'GET', :url => url , :headers => headers
    # puts response

    # if params[:user_id].present?
    #   @user = User.find(params[:user_id])
    #   @user.increment!(:visit, by=1)
    # end
  end
end
