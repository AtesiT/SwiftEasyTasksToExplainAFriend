//  Casting types

class Vehicle {
    let name: String
    
    func returnName() {
        print("Your vehicle is called \(name)")
    }
    
    init(name: String) {
        self.name = name
    }
}

class Aircraft: Vehicle {
    var amountTimeToBeInTheSky: Float
    
    func recognizeTime() {
        print("The airplane can be in the sky \(amountTimeToBeInTheSky)")
    }
    init(amountTimeToBeInTheSky: Float, name: String) {
        self.amountTimeToBeInTheSky = amountTimeToBeInTheSky
        super.init(name: name)
        
    }
}

class Boat: Vehicle {
    var yearOfWhenSinceInWater: Int
    
    func sinceYearInWwater() {
        print("The boat since \(yearOfWhenSinceInWater) year")
    }
    
    init(name: String, yearOfWhenSinceInWater: Int) {
        self.yearOfWhenSinceInWater = yearOfWhenSinceInWater
        super.init(name: name)
    }
}

let aircraft1 = Aircraft(amountTimeToBeInTheSky: 6, name: "Boeing")
let aircraft2 = Aircraft(amountTimeToBeInTheSky: 10, name: "Airbus")

let boat1 = Boat(name: "YachtOfLove", yearOfWhenSinceInWater: 2001)
let boat2 = Boat(name: "GoldenYacht", yearOfWhenSinceInWater: 2020)


let array = [aircraft1, aircraft2, boat1, boat2]
//  Automatic array of vehicle

for everyVehicle in array {
    everyVehicle.returnName()
    
    if everyVehicle is Aircraft {
//        (everyVehicle as! Aircraft).recognizeTime()
        
        let theAircratToDoFunction = everyVehicle as! Aircraft
        theAircratToDoFunction.recognizeTime()
    } else if everyVehicle is Boat {
        (everyVehicle as! Boat).sinceYearInWwater()
    }
}

print("The \nsecond \nway")

for anyVehicle in array {
    if let aircraft = anyVehicle as? Aircraft {
        aircraft.recognizeTime()
    } else if let boat = anyVehicle as? Boat {
        boat.sinceYearInWwater()
    }
}

print("The \nthird \nway")

for againVehicle in array {
    switch againVehicle {
    case let aircraft as Aircraft:
        aircraft.recognizeTime()
    case let boat as Boat:
        boat.sinceYearInWwater()
    default:
        break
    }
}
