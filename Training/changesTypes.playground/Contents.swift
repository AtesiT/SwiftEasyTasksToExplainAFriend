//  Casting types

class Vehicle {
    let name: String
    let owner:Owner?
    func returnName() {
        print("Your vehicle is called \(name)")
    }
    
    init(name: String, owner: Owner? = nil) {
        self.name = name
        self.owner = owner
    }
}

struct Owner {
    var name: String
    var descriptionOfHuman: AboutHuman
    
}

struct AboutHuman {
    var age: Int
    var colorOfHairs: String
    var insideOfPockets: [Things]?
}

struct Things {
    var thingIs: String
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



let theVehicle1 = Vehicle(name: "Ship", owner: nil)


print("\n\n")
let aboutHuman1 = AboutHuman(age: 25, colorOfHairs: "Brown", insideOfPockets: [Things(thingIs: "Phone"), Things(thingIs: "Keys")])
let owner1 = Owner(name: "Alice", descriptionOfHuman: aboutHuman1)
let theVehicle2 = Vehicle(name: "Ship2", owner: nil)
theVehicle2.returnName()


let aboutHuman2 = AboutHuman(age: 20, colorOfHairs: "Blonde", insideOfPockets: nil)
let aboutHuman3 = AboutHuman(age: 22, colorOfHairs: "Black", insideOfPockets: nil)

let owner2 = Owner(name: "Bob", descriptionOfHuman: aboutHuman2)
let owner3 = Owner(name: "Charlie", descriptionOfHuman: aboutHuman3)

let arrayOwners = [owner1, owner2, owner3]

// MARK: - Optional chain
for everyOwner in arrayOwners {
//    if let owner = everyOwner {
//        if let descrtiption = owner.descriptionOfHuman {
//            if let smthInPockets = owner.descriptionOfHuman.insideOfPockets {
//                if let theThing = smthInPockets.first {
//                    print(theThing.thingIs)
//                }
//            }
//        }
//    }
    //  Print the last element of a chain
    if let theThing = everyOwner.descriptionOfHuman.insideOfPockets?.first {
        print(theThing)
        print("\(everyOwner.name) has \(theThing.thingIs)")
    }
    //  Only check that last element of a chain presents
    if let everyThing = everyOwner.descriptionOfHuman.insideOfPockets, !everyThing.isEmpty {
        print(everyThing.first!)
        print(everyThing.first!.thingIs)
    }
}

