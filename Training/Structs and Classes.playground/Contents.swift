// MARK: Practice with use structs and classes

// Init
struct Building {
    var price: Int
    func recognizePrice() -> Int {
        return price
    }
    // FIX. IT WAS A STRUCT NOT A CLASS
}

let buildingOne = Building(price: 5000)
print(buildingOne.recognizePrice())
print(buildingOne.price)


class Vehicle {
    var price: Int
    func recognizePrice() -> Int {
        return price
    }
    
    init(price: Int) {
        self.price = price
    }
}


extension Vehicle: CustomStringConvertible {
    var description: String {
        return "Price of the vehicle is \(price)"
    }
}

// Classes need init


let vehicleOne = Vehicle(price: 10000)
print(vehicleOne)
// Without CusstonStringConverible just was a name of file
// Needs to use protocol to describe



class Aiplane: Vehicle {
    let maxHeightFlight: Int
    
    func describeTheAirplane() -> String {
        "This airplane can fly up to \(maxHeightFlight) meters. Price: \(price)"
    }
    
    init(maxHeightFlight: Int, price: Int) {
        self.maxHeightFlight = maxHeightFlight
        super.init(price: price)
    }
}

let airplaneOne = Aiplane(maxHeightFlight: 50, price: 75000)
print(airplaneOne.price)
print(airplaneOne.maxHeightFlight)
print(airplaneOne.describeTheAirplane())

