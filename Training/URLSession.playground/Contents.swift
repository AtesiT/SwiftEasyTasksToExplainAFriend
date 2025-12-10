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
    
    @IBOutlet weak var id: UILabel!
    @IBOutlet weak var name: UILabel!
    @IBOutlet weak var email: UILabel!
    
    func configure(with anyHuman: arrayFromJSON) {
        id.text = String(anyHuman.id)
        name.text = anyHuman.name
        email.text = anyHuman.email
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
