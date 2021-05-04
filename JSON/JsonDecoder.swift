    @IBAction func btn_request(_ sender: UIButton) {
        let api = "https://api.openweathermap.org/data/2.5/weather?units=metric&appid=b3ceaef88d93238d6f3c0cfe6212bf48&q=guayaquil"
        if let url = URL(string: api){
            URLSession.shared.dataTask(with: url, completionHandler: {(data,response,error)in
                if error != nil{
                    print(error!)
                    return
                }
                if let datasession = data{
                    self.parseJSON(datos: datasession)
                }
            }).resume()
        }
    }
    
// IMPLEMENTING THE JSONDECODER WITH A TYPE MODEL INSTANCE

    func parseJSON(datos: Data) {
        
        // JSONDecoder: Object that can decode JSON (An object that decodes instances of a data type from JSON objects)
        // .decode: Decodifica la instancia del tipo dado (Modelo) con el resultado (datos)
        
        do{
            // Para referirse al tipo de una Objeto, utilizamos el '.self'
            let decodedData = try JSONDecoder().decode(Modelo.self, from: datos) // MODELLED THE RESPOND 'DATOS' TO 'DECODEDATA'
            
            // La variable del tipo dado se inicializara con los volores obtenidos del Jason, siempre y cuando sean iguales tanto la variable del tipo como la key en el Jason. (debe haber MATCH)
            // El objeto 'decodedData' va ha ser inicializado solo con los valores que se hayan establecido com parametros, y no con todos los datos obtenidos del Jason
            
            print(decodedData.main.temp)
            print(decodedData.main.feels_like)
        }catch let error {
            print(error)
        }
    }
}

// THE TYPE MUST ADOPTS DECODABLE FOR THE USE OF JSONDECODER
struct Modelo: Decodable {
    var main: Main
}

struct Main: Decodable {
    let temp: Double
    let feels_like: Double
    let temp_min: Int
    let temp_max: Int
    let pressure: Int
    let humidity: Int
}


// JSON FILE ------------------------------------------------------------------------------------

{
  "coord": {
    "lon": -79.9,
    "lat": -2.1667
  },
  "weather": [
    {
      "id": 803,
      "main": "Clouds",
      "description": "broken clouds",
      "icon": "04d"
    }
  ],
  "base": "stations",
  "main": {
    "temp": 30,
    "feels_like": 31.71,
    "temp_min": 30,
    "temp_max": 30,
    "pressure": 1012,
    "humidity": 54
  },
  "visibility": 10000,
  "wind": {
    "speed": 2.57,
    "deg": 140
  },
  "clouds": {
    "all": 75
  },
  "dt": 1619367303,
  "sys": {
    "type": 1,
    "id": 8534,
    "country": "EC",
    "sunrise": 1619349359,
    "sunset": 1619392723
  },
  "timezone": -18000,
  "id": 3657509,
  "name": "Guayaquil",
  "cod": 200
}


// Best practices

// Codable is a typealias for Encodable and Decodable
struct Book: Codable {
    let title: String
    let numberOfPages: Int
    let author: String
}

// Encode a instance to a JSON object:
do {
    let book = Book(title: "The Power", numberOfPages: 50, author: "Juan")
    let encoder = JSONEncoder()
    let data = try encoder.encode(book)
    print(data) 
    } catch error {
        print("ERROR: \(error.localizedDescription)")
    }

// Decode JSON object to an instance
    let decoder = JSONDecoder()
    let decodedInstance = try decoder.decode(Book.type, from: data)
}

