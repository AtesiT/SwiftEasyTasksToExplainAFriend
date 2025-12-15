import UIKit


//  MARK: -       Model

enum Links {
    case Json
    case JsonTwoInside
    case GooglePhoto
    case ApplePhoto
    
    var url: URL {
        switch self {
        case .Json:
            return URL(string: "https://jsonplaceholder.typicode.com/posts/1/")!
        case .JsonTwoInside:
            return URL(string: "https://jsonplaceholder.typicode.com/posts/1/comments")!
        case .GooglePhoto:
            return URL(string: "https://upload.wikimedia.org/wikipedia/commons/thumb/2/2f/Google_2015_logo.svg/1200px-Google_2015_logo.svg.png")!
        case .ApplePhoto:
            return URL(string: "https://upload.wikimedia.org/wikipedia/commons/f/fa/Apple_logo_black.svg")!
        }
    }
}

struct Datas: Decodable {
    var id: Int
    var body: String
    
    enum CodingKeys: String, CodingKey {
        case id = "id"
        case body = "description"
    }
    
}
//  MARK: -         General Function To Use In Other Classes

final class NetworkManager {
    static let shared = NetworkManager()
    
    private init() {}
    
    func fetchData(from url: URL, completion: @escaping(Data) -> Void) {
        URLSession.shared.dataTask(with: Links.Json.url) { data, response, error in
            guard let data, let response else {
                print(error?.localizedDescription ?? "We can't take error even")
                return
            }
            do {
                let data = try JSONDecoder().decode(Datas.self, from: data)
                print(data)
            } catch {
                print(error.localizedDescription)
            }
        }
    }
    
    func fetchImage(from url: URL, completion: @escaping(Data) -> Void) {
        DispatchQueue.global().async {
            guard let imageData = try? Data(contentsOf: url) else { return }
            DispatchQueue.main.async {
                completion(imageData)
            }
        }
    }
}



//  MARK: -         Universal Data

enum Errors: Error {
    case MemoryError
    case RunningError
    case DataError
    
    var title: String {
        switch self {
        case .MemoryError:
            return "Memory in your device is not enough"
        case .RunningError:
            return "Something went wrong"
        case .DataError:
            return "Data is not correct"
        }
    }
}

final class UniversalNetworkManager {
    static let shared = UniversalNetworkManager()
    
    private init() {}
    
    func fetchUniversalData<T: Decodable>(_ type: T.Type, from url: URL, completion: @escaping(T) -> Void) {
        URLSession.shared.dataTask(with: Links.Json.url) { data, response, error in
            guard let data, let response else {
                print(error?.localizedDescription ?? "No error - no anything")
                return
            }
            do {
                let data = try JSONDecoder().decode(T.self, from: data)
                print(data)
            } catch {
                print(error.localizedDescription)
            }
        }
    }
    
    func fetchAnyDataWithReturnErrors<T: Decodable>(_ type: T.Type, from url: URL, completion: @escaping(Result<T,Errors>) -> Void) {
        URLSession.shared.dataTask(with: Links.Json.url) { data, _, error in
            guard let data else { return }
            
            do {
                let jsonData = try JSONDecoder().decode(T.self, from: data)
                DispatchQueue.main.async {
                    completion(.success(jsonData))
                }
            } catch {
                completion(.failure(.DataError))
            }
        }
    }
    
    func fetchUniversalImage(from url: URL, competion: @escaping(Data) -> Void) {
        DispatchQueue.global().async {
            guard let imageData = try? Data(contentsOf: url) else { return }
            DispatchQueue.main.async {
                competion(imageData)
            }
        }
    }
}




