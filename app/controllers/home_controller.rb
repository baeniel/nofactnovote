class HomeController < ApplicationController
  require 'rubygems'
  require 'rest_client'
  require 'cgi'

  def index
    if params[:keyword].present?
      @keyword = params[:keyword].gsub(/\s+/, "")

      @district = District.ransack(name_cont: @keyword).result(distinct: true)
      @district = District.find_by(id: @district)

      @congress = User.ransack(name_cont_any: @keyword).result(distinct: true)
      @congress = User.where(id: @congress)

      url = 'http://apis.data.go.kr/9760000/CommonCodeService/getCommonSggCodeList?serviceKey=pBCDhUSP1lJ77BU58EJBQUlcKirh4gX1ap427Pya5Jws%2FsBX7jKtz4IwOuB12v0W%2FVN8MM%2B0Yl%2FuOxXnvJFdpA%3D%3D'
      headers = { :params => { CGI::escape('numOfRows') => '253',CGI::escape('sgId') => '20200415',CGI::escape('sgTypecode') => '2' } }
      response = RestClient::Request.execute :method => 'GET', :url => url , :headers => headers

      response_list = response.body
      response_xml = Nokogiri::XML(response_list)
      @sggName = response_xml.xpath("//sggName").map {|name| name.text}
      @sgg_ref = []

      i = 0
      while i < 254
        if @sggName[i]&.include? params[:keyword]
          @sgg_ref << @sggName[i]
        end
        i += 1
      end

      respond_to do |format|
        format.js
      end
    end

    # if params[:user_id].present?
    #   @user = User.find(params[:user_id])
    #   @user.increment!(:visit, by=1)
    # end
  end
end
