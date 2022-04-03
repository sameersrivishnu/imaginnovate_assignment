class WeathersController < ApplicationController
  def index
  	status, @message, @data = WeatherData.get_data(params[:city])
  	respond_to do |format|
      format.js {render js: "#{render_to_string(:partial => "index", :layout => false)}"}
      format.html
    end
  
  end
end
