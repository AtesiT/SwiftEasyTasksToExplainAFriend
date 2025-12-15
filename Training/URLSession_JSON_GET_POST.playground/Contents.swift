import UIKit

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

struct Data {
    var id: Int
    var body: String
    
    enum CodingKeys: String, CodingKey {
        case id = "id"
        case body = "description"
    }
    
}

