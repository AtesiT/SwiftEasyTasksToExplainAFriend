import UIKit

enum NetworkError: Error {
    case badURL
}

struct dataToDecode: Decodable {
    let userId: String
    let id: Int
    let title: String
    let completed: Bool
}

let anyUrl = URLRequest(url: URL(string: "https://jsonplaceholder.typicode.com/todos/1")!)

func fetchData(theUrl url: URL, completion: @escaping (Result<Data,NetworkError>) -> Void) {
    URLSession.shared.dataTask(with: url) { data, response, error in
        guard let data else {
            completion(.failure(.badURL))
            return
        }
        do {
            let data = try JSONDecoder().decode(dataToDecode.self, from: data)
        } catch {
            completion(.failure(.badURL))
        }
    }
}
