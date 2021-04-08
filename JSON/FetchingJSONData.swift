// Forma 1
func performRequest(from ciudad: String) {
        let url = "https://api.openweathermap.org/data/2.5/weather?appid=b3ceaef88d93238d6f3c0cfe6212bf48"
        if let newUrl = URL(string: url + "&q=\(ciudad)"){
            URLSession.shared.dataTask(with: newUrl) { (data, response, error) in
                if let data = data{
                    do{
                        let res = try JSONDecoder().decode(JSONweather.self, from: data) // Modelled the respond data to res
                        print(res.name)
                        print(res.weather[0].id)
                        print(res.main.temp)
                    }catch let error{
                        print(error)
                    }
                }
            }.resume()
        }
    }
    
// Forma 2
    func performRequest(with urlString: String) {
        if let url = URL(string: urlString){
            let urlSession = URLSession(configuration: .default)
            let sessionTask = urlSession.dataTask(with: url) { (data, response, error) in
                if error != nil{
                    self.delegate?.didFailWithError(error: error!)
                    return
                }
                if let safeData = data{
                    if let weather = self.parseJason(safeData){
                        self.delegate?.didUpdateWeather(self, weather: weather) // Usamos el self, devido a que estamos en un Clousure
                    }
                }
            }
            sessionTask.resume()
        }
    }
    
   func parseJason(_ weatherData: Data) -> WeatherModel? {
        let decoder = JSONDecoder()
        do {
            let decodedData = try decoder.decode(WeatherData.self, from: weatherData)
            let weatherID = decodedData.weather[0].id
            let cityName = decodedData.name
            let temperatura = decodedData.main.temp
            let weatherModel = WeatherModel(cityName: cityName, weatherID: weatherID, temperatura: temperatura)
            return weatherModel
        }catch let error{
            delegate?.didFailWithError(error: error)
            return nil
        }
    }
