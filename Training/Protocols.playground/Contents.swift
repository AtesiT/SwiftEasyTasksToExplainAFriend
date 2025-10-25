import Foundation

//final class User {
//    let name: String
//    let age: Int
//    
//    init(name: String, age: Int) {
//        self.name = name
//        self.age = age
//    }
//}
//
//let userOne = User(name: "Alex", age: 20)
//print(userOne)


//              Сверху класс без подписания его под протокол, он вывод название файла
//              Снизу класс с подписанием под протокол, для него специфический вывод

//  Если реализовать CustomStringConvertible, то необходимо реализовать Description

final class User {
    var name: String
    var age: Int

    init(name: String, age: Int) {
        self.name = name
        self.age = age
    }
}


// MARK: - CustomStringConvertible
extension User: CustomStringConvertible {
    var description: String {
        return "User(name: \(name), age: \(age))"
    }
    
}

// MARK: - JSONSeriazable

protocol JSONSeriazable {
    var identifier: String { get }
    func toJSON() -> [String: Any]
    func fromJSON(_ json: [String: Any])
}

// Делаем свойство и метод протокола необязательным в реализации
extension JSONSeriazable {
    var identifier: String {
        ""
    }
    func fromJSON(_ json: [String: Any]) {}
}

// Добавляем наш протокол к классу
extension User: JSONSeriazable {
    var identifier: String {
        "User_\(name)"
    }
    func toJSON() -> [String: Any] {
        ["name":name,"age":age]
    }
    func fromJSON(_ json: [String : Any]) {
        name = json["name"] as? String ?? ""
        age = json["age"] as? Int ?? 0
    }
}

let userOne = User(name: "Alex", age: 20)
print(userOne)

// Создание JSON файла на основе модели данных
print(userOne.toJSON())

// Обновление свойт локальной модели на основе JSON
let json: [String: Any] = ["name": "Steve", "age": 20]
userOne.fromJSON(json)
print(userOne)

// MARK: - Attempt to create a new protocol

final class Car {
    let name: String
    let price: Int
    let discount: Int
    
    init(name: String, price: Int, discount: Int) {
        self.name = name
        self.price = price
        self.discount = discount
    }
}

protocol CheckRealPriceWithDiscount {
    func getRealPrice() -> Int
}

extension Car: CheckRealPriceWithDiscount {
    func getRealPrice() -> Int {
        return (price - discount)
    }
}


let ferrari = Car(name: "Ferrari", price: 50000, discount: 5000)
print(ferrari.getRealPrice())

// Next Attempt

class House {
    let name: String
    let price: Int
    let discount: Int
    
    init(name: String, price: Int, discount: Int) {
        self.name = name
        self.price = price
        self.discount = discount
    }
}

final class Apartment: House {
    let floor: Int
    
    init(name: String, price: Int, discount: Int, floor: Int) {
        self.floor = floor
        super.init(name: name, price: price, discount: discount)
    }
}


extension House: CheckRealPriceWithDiscount {
    func getRealPrice() -> Int {
        return (price - discount)
    }
}

let newHome = Apartment(name: "New-York City", price: 250000, discount: 10000, floor: 25)
print(newHome.getRealPrice())


// MARK: -

