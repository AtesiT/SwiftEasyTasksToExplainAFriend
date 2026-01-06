import UIKit

enum NetworkError: Error {
    case badURL
}

struct DataToDecode: Decodable {
    let userId: Int
    let id: Int
    let title: String
    let completed: Bool
}

//  Fix URL
let anyUrl = URL(string: "https://jsonplaceholder.typicode.com/todos/1")!

func fetchData(theUrl url: URL, completion: @escaping (Result<DataToDecode,NetworkError>) -> Void) {
    URLSession.shared.dataTask(with: url) { data, response, error in
        guard let data else {
            completion(.failure(.badURL))
            return
        }
        do {
            let theResult = try JSONDecoder().decode(DataToDecode.self, from: data)
            completion(.success(theResult))
        } catch {
            completion(.failure(.badURL))
        }
    }.resume()
}

fetchData(theUrl: anyUrl) { result in
    switch result {
    case .success(let data):
        print(data)
    case .failure(let error):
        print(error)
    }
}
