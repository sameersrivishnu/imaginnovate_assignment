class WeatherData

	def self.get_data city = nil
		return false, "City is Empty" , [] if city.blank?
		res = Geocoder.search(city)
		if res.present?
			begin
				data = res[0].data
				lat = data["lat"]
				lon = data["lon"]
				r = `curl -X GET "https://api.openweathermap.org/data/2.5/forecast?lat=#{lat}&lon=#{lon}&appid=1635890035cbba097fd5c26c8ea672a1"`
				response = JSON.parse(r)
				if response["cod"] == "200"
					list = response["list"]
					format_list = list.map{|e| e["dt"] = Time.at(e["dt"]).to_date; e}
					grouped_list = format_list.group_by{|e| e["dt"]}
					return true, "Data", grouped_list
				else
					return false, response["message"], []
				end
			rescue Exception => e
				return false, e.message, []
			end
		else
			return false, "Invalid city", []
		end
	end
end