//  Properties


struct Car {
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
}

var newCar = Car(mark: "Porsche", model: "911", year: 2000)
print(newCar.fullName)
newCar.fullName = "Lamborghini Huracán 1964"
print(newCar.fullName)



