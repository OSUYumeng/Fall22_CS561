import Alamofire

public protocol WeatherService {
    func getTemperature() async throws -> Int
}

enum BaseUrl : String{

    case ServerLink = "https://api.openweathermap.org/data/2.5/weather?q=corvallis&units=imperial&appid=add08dbd22c529bbf7d66da376b34822"
    case mockServer = "https://http://localhost:3000/data/2.5/weather"
}

//?q=corvallis&units=imperial&appid=add08dbd22c529bbf7d66da376b34822

class WeatherServiceImpl: WeatherService {
    
    let url = BaseUrl.ServerLink.rawValue

    func getTemperature() async throws -> Int {
        
        return try await withCheckedThrowingContinuation { continuation in
            AF.request(url, method: .get).validate(statusCode: 200..<300).responseDecodable(of: Weather.self) { response in
                switch response.result {
                case let .success(weather):
                    let temperature = weather.main.temp
                    let temperatureAsInteger = Int(temperature)
                    continuation.resume(with: .success(temperatureAsInteger))

                case let .failure(error):
                    continuation.resume(with: .failure(error))
                }
            }
        }
    }
}

public struct Weather: Decodable {
    let main: Main

    struct Main: Decodable {
        let temp: Double
    }
}