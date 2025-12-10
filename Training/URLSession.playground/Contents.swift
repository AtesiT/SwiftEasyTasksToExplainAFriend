import Foundation

enum Course {
    case Programming // 1 object
    case Math
    case Analytics // Has an array
    case Science
    
    var url: URL {
        switch self {
        case .Programming:
            return URL(string: "https://jsonplaceholder.typicode.com/posts/1")!
        case .Math:
            return URL(string: "")!
        case .Analytics:
            return URL(string: "https://jsonplaceholder.typicode.com/posts/1/comments")!
        case .Science:
            return URL(string: "")!
        }
    }
}

struct anyDataToParse: Decodable {
    let id: Int
    let title: String
    let number: String?
    
}

private func fetchData() {
    URLSession.shared.dataTask(with: Course.Programming.url) { data, _, error in
        guard let data else {
            print(error?.localizedDescription ?? "No data")
            return
        }

        do {
            let dataFromJSON = try JSONDecoder().decode(anyDataToParse.self, from: data)
            print(dataFromJSON)
            
        } catch {
            print(error)
        }

    }.resume()
}

fetchData()
