//  Protocols

protocol Movable {
    var speed: Int { get }
    func move()
}

class Human: Movable {
    var speed: Int = 3
    
    func move() {
        print("Скорость ходьбы человека равняется \(self.speed) км/ч")
    }
    
    var firstName: String
    init(firstName: String) {
        self.firstName = firstName
    }
}

struct Car: Movable {
    var speed: Int = 40
    
    func move() {
        print("Машина едет со скоростью \(self.speed) км/ч")
    }
    
    var mark: String
}

struct Cat: Movable {
    var speed: Int = 2
    
    func move() {
        print("Кошка перемещается со скоростью \(self.speed) км/ч")
    }
    
    var name: String
}

let newHuman = Human(firstName: "John")
let newCar = Car(mark: "Toyota")
let newCat = Cat(name: "Cat")

let objects: [Movable] = [newHuman, newCar, newCat]

for everyObjectInObjectsArray in objects {
    everyObjectInObjectsArray.move()
}
