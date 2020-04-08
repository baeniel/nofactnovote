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
      # url = 'http://apis.data.go.kr/9760000/CommonCodeService/getCommonSggCodeList?serviceKey=pBCDhUSP1lJ77BU58EJBQUlcKirh4gX1ap427Pya5Jws%2FsBX7jKtz4IwOuB12v0W%2FVN8MM%2B0Yl%2FuOxXnvJFdpA%3D%3D'
      # headers = { :params => { CGI::escape('pageNo') => '1',CGI::escape('numOfRows') => '10',CGI::escape('sgId') => '20200415',CGI::escape('sgTypecode') => '2' } }
      # response = RestClient::Request.execute :method => 'GET', :url => url , :headers => headers
      # response_list = reponse.body
      # response_xml = Nokogiri::XML(response_list)
      #
      #
      #
      # if response_xml.include? params[:keyword]
      #   @sggName = response_xml.xpath("//sggName")
      #   puts @sggName
      # end

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


if false
  headers = { :params => { CGI::escape('pageNo') => '1',CGI::escape('numOfRows') => '10',CGI::escape('sgId') => '20200415',CGI::escape('sgTypecode') => '1',CGI::escape('sdName') => '부주동',CGI::escape('totalCount') => '1',CGI::escape('sOrder') => '1',CGI::escape('num') => '1' } }

  Nokogiri::XML(response.body).xpath("//sggName").map { |vote| vote.text}
end
