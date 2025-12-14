import Foundation

enum Course {
    case Programming // 1 object
    case Math
    case Analytics // Has object in array
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
    let title: String?
    let number: String?
    
    //  Just a test to convert names
    enum CodingKeys: String, CodingKey {
        case id = "id"
        case title = "title"
        case number = "number"
    }
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

private func fetchDatas() {
    URLSession.shared.dataTask(with: Course.Analytics.url) { data, _, error in
        guard let data else {
            print(error?.localizedDescription ?? "Nothing")
            return
        }
        do {
            let datas = try JSONDecoder().decode([anyDataToParse].self, from: data)
            print(datas)
        } catch {
            print(error)
        }
    }.resume()
}

fetchData()
fetchDatas()


//  MARK: - Practice with tableView
import UIKit

final class cellTable: UITableViewCell {
    
    private let networkManager = NetworkManager.shared
    
    @IBOutlet weak var id: UILabel!
    @IBOutlet weak var name: UILabel!
    @IBOutlet weak var email: UILabel!
    @IBOutlet weak var photo: UIImageView!
    
    func configure(with anyHuman: arrayFromJSON) {
        id.text = String(anyHuman.id)
        name.text = anyHuman.name
        email.text = anyHuman.email
        networkManager.fetchImage(from: Images.image.url) { [unowned self] result in
            switch result {
            case .success(let imageData):
                photo.image = UIImage(data: imageData)
            case .failure(let error):
                print(error)
            }
        }
        
    }
}




struct arrayFromJSON {
    let id: Int
    let name: String
    let email: String
}

let somebody = arrayFromJSON(id: 1, name: "John", email: "mail@email.com")
let somebody2 = arrayFromJSON(id: 2, name: "Jane", email: "mail2@email.com")

let arrayOfPeople: [arrayFromJSON] = [somebody, somebody2]





final class tableViewController: UITableViewController {
    override func numberOfSections(in tableView: UITableView) -> Int {
        arrayOfPeople.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        guard let cell = cell as? cellTable else {return UITableViewCell()}
        let human = arrayOfPeople[indexPath.row]
        cell.configure(with: human)
        return cell
    }
}


extension tableViewController {
    func reloadDataInNotMainThread() {
        DispatchQueue.main.async {
            self.tableView.reloadData()
        }
    }
}

// MARK: - smth was added to practice with replace some big code on the code that in class NetworkManager

enum Images {
    case image
    
    var url: URL {
    switch self {
    case .image: return URL(string: "https://upload.wikimedia.org/wikipedia/commons/thumb/2/2f/Google_2015_logo.svg/2560px-Google_2015_logo.svg.png")!
        }
    }
}

final class ImageViewController: UIViewController {
    
    private let networkManager = NetworkManager.shared
    
    @IBOutlet var imageView: UIImageView!
    
    private func fetchImage() {
        networkManager.fetchImage(from: Images.image.url) { [unowned self] result in
            switch result {
            case .success(let imageData):
                imageView.image = UIImage(data: imageData)
            case .failure(let error):
                print(error)
            }
        }
    }
}

//  MARK: - NetworkManager

enum NetworkError: Error {
    case invalidURL
    case noData
    case decodingError
}

final class NetworkManager {
    static let shared = NetworkManager()
    
    private init() {}
    
    func fetchImage(from url: URL, completion: @escaping (Result<Data, NetworkError>) -> Void) {
        DispatchQueue.global().async {
            guard let imageData = try? Data(contentsOf: url) else {
                completion(.failure(.noData))
                return
            }
            DispatchQueue.main.async {
                completion(.success(imageData))
            }
        }
    }
}

//  MARK: - JUST A PRACTICE (REPEAT)

let anyURL = URL(string: "https://jsonplaceholder.typicode.com/posts")!

struct ParseUser: Decodable {
    let userId:     Int
    let id:         Int
    let title:      String
    let text:       String
    
    enum CodingKeys: String, CodingKey {
        case userId = "userId"
        case id = "id"
        case title = "title"
        
        case text = "body"
    }
}

func urlSessionParsseData() {
    URLSession.shared.dataTask(with: anyURL) { data, response, error in
        guard let data, let response else {
            print(error?.localizedDescription ?? "Problems? No. ")
            return
        }
        do {
            let ourParseData = try JSONDecoder().decode([ParseUser].self, from: data)
            print(ourParseData)
        } catch {
            print(error)
        }
    }.resume()
}

func fetchAnyData(from url: URL, completion: @escaping (Data) -> Void) {
    DispatchQueue.global().async {
        guard let imageData = try? Data(contentsOf: url) else {return}
        DispatchQueue.main.async {
            completion(imageData)
        }
    }
}

//  I FORGOT ALREADY 0.0
func fetch(from url: URL, completion: @escaping (Data) -> Void) {
    DispatchQueue.global().async {
        guard let imageData = try? Data(contentsOf: url) else {return}
        DispatchQueue.main.async {
            completion(imageData)
        }
    }
}

//  Let's write again (after 3 days)

func fetchSmth(from url: URL, completion: @escaping (Data) -> Void) {
    DispatchQueue.global().async {
        guard let imageData = try? Data(contentsOf: url) else {return}
        DispatchQueue.main.async {
            completion(imageData)
        }
    }
}

//  MARK: - REPEAT:     JSON    &&  DispatchQueue   &&  Practice with @escaping Result<Success,Failure>

enum LinksOnJSON {
    case user
    case users
    
    var url: URL {
        switch self {
        case .user: return URL(string: "https://jsonplaceholder.typicode.com/posts/1")!
        case .users: return URL(string: "https://jsonplaceholder.typicode.com/posts")!
        }
    }
}

struct styleJSON: Decodable {
    let userId:     Int
    let id:         Int
    
    
}

final class MainFetchData {
    static let shared = MainFetchData()
    
    private init() {}
    
    func fetchDataWithUseResult(from url: URL, completion: @escaping (Result<Data, NetworkError>) -> Void) {
        DispatchQueue.global().async {
            guard let imagedata = try? Data(contentsOf: url) else {
                completion(.failure(NetworkError.noData))
                return}
            DispatchQueue.main.async {
                completion(.success(imagedata))
            }
        }
    }
    func fetchCourse(from url: URL, completion: @escaping (Result<Data, NetworkError>) -> Void) {
        URLSession.shared.dataTask(with: LinksOnJSON.user.url) { data, response, error in
            guard let data, let response else {return}
            
            do {
                let dataJSON = try JSONDecoder().decode(styleJSON.self, from: data)
                print(dataJSON)
            } catch {
                print(error)
            }
        }.resume()
    }
}

final class TakeImageViewController: UIViewController {
    @IBOutlet weak var imageView: UIImageView!
    
    private let mainFetchData = MainFetchData.shared
    
    func fetchImage() {
        mainFetchData.fetchDataWithUseResult(from: anyURL) { [unowned self] result in
        switch result {
        case .success(let data):
            self.imageView.image = UIImage(data: data)
        case .failure(let error):
            print(error)
            }
        }
    }
}

let theURL = URL(string: "https://jsonplaceholder.typicode.com/posts/1")!
let mainFetchData = MainFetchData.shared
mainFetchData.fetchCourse(from: theURL) { result in
    switch result {
    case .success(let data):
        print(data)
        print("Success")
    case .failure(let error):
        print(error)
        print("Failed")
    }
}


