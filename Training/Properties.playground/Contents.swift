//  Properties


struct Car {
    static var count: Int = 0
    static func getCountCars()-> Int {
        return Car.count
    }
    
    var mark: String
    var model: String
    var year: Int {
        
        willSet {
            print("Oldvalue year was \(self.year)")
            print("Newvalue year is \(newValue)")

        }
        
        didSet {
            print("Current value of year is \(self.year)")
        }
    }
    var fullName: String {
        //  We can make simpler if we will be use only GET:
        //return "\(mark) \(model) \(year)"
        get {
            return "\(mark) \(model) \(year)"
        }
        set {
            print(newValue)
            let full = newValue.split(separator: " ") // .components(separatedBy: " ")
            if full.count > 2 {
                self.mark = String(full[0])
                self.model = String(full[1])
                if let newYear = Int(full[2]) {
                    self.year = newYear
                }
            }
        }
    }
    lazy var price: Int = getPrice()
    init(mark: String, model: String, year: Int) {
        self.mark = mark
        self.model = model
        self.year = year
        Car.count += 1
    }
}

// The func to interaction with lazy properties
func getPrice()->Int{
    print("Start")
    
    var i = 0
    while i < 10 {
        
        i+=1
    }
    print("Finish")
    return 10
}

var newCar = Car(mark: "Porsche", model: "911", year: 2000)
print(newCar.fullName)
newCar.fullName = "Lamborghini Huracán 1964"
print(newCar.fullName)

var newCar2 = Car(mark: "Porsche", model: "911", year: 2000)
var newCar3 = Car(mark: "Porsche", model: "911", year: 2000)

print(Car.count)
print(Car.getCountCars())


