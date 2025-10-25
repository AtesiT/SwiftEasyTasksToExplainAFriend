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
    let name: String
    let age: Int

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
    func toJSON() -> [String: Any]
}

extension User: JSONSeriazable {
    func toJSON() -> [String: Any] {
        ["name":name,"age":age]
    }
}

let userOne = User(name: "Alex", age: 20)
print(userOne)

// Создание JSON файла на основе модели данных
let json = userOne.toJSON()
print(json)


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

