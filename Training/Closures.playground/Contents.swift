// Closures

var unversalFunc: (Double, Double) -> Double

func addition(firstNumber: Double, secondNumber: Double) -> Double {
    return firstNumber + secondNumber
}

func subtraction(firstNumber: Double, secondNumber: Double) -> Double {
    return firstNumber - secondNumber
}

let universalFunc = addition
print(universalFunc(10, 20))

let newCars: [String:Int]
newCars = ["Ferrari":250000, "Porsche": 900000, "Lamborghini": 7500000]

func toFilterCars(cars: [String:Int], filter: (Int)->Bool)->[String:Int] {
    var richCars = [String:Int]()
    
    for (nameCar, price) in cars {
        if filter(price) {
            richCars[nameCar] = price
        }
    
    }
    return richCars
}

func poorCars(price: Int) -> Bool {
    if price <= 500000 {
        return true
    } else { return false }
}

func richCars(price: Int) -> Bool {
    if price > 500000 {
        return true
    } else {return false}
}

print(toFilterCars(cars: newCars, filter: richCars))
print(toFilterCars(cars: newCars, filter: poorCars))

