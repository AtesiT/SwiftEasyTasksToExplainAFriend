import UIKit

// MARK: - Data Structs, Errors, URLs

struct DataToDecode: Decodable {
    let userId: Int
    let id: Int
    let title: String
    let completed: Bool
}

enum NetworkError: Error {
    case badURL
}

let anyUrl = URL(string: "https://jsonplaceholder.typicode.com/todos/1")!


//  MARK: - The Function

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


//  MARK: - Calling function

fetchData(theUrl: anyUrl) { result in
    switch result {
    case .success(let data):
        print(data)
    case .failure(let error):
        print(error)
    }
}

fetchData(theUrl: anyUrl) { result in
    if let data = try? result.get() {
        print(data)
    }
}

//  MARK: - Test the shtick in result

let anyString  = ""
let result = Result { try String(contentsOfFile: anyString) }
print(result)
