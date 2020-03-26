class HomeController < ApplicationController
  def index
    @data = JSON.parse(File.read("#{Rails.root}/public/korea.json"))

    #data의 위도들만 담아내기 위해서
    @positions = []

    #그 위도에 해당하는 지역구를 담아내기 위해서
    @districts = []

    @count = 0

    while @count < @data["positions"].length
      @positions << @data["positions"][@count]["lat"]
      @districts << District.find_by(lat: @positions[@count])

      @count = @count + 1
    end
  end
end
