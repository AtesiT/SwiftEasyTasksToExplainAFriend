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


// MARK: - The First Attempt of the Closure
print(toFilterCars(cars: newCars, filter: {(price: Int) -> Bool in
    if price <= 500000 {
        return true
    } else {return false}
}))

print(toFilterCars(cars: newCars, filter: {(price: Int) -> Bool in
    if price > 500000 {
        return true
    } else {return false}
}))


// MARK: - The second Attempt of the Closure (make smaller code)

//  We can destroy the IF ELSE because the expression return true\false anyway

print(toFilterCars(cars: newCars, filter: {(price: Int) -> Bool in
    return price <= 500000
}))

print(toFilterCars(cars: newCars, filter: {(price: Int) -> Bool in
    return price > 500000
}))

// MARK: - The third Attempt of the Closure (make smaller code again)

/*
    Swift the smart and language and knews what to return in the function
    Also Swift the safe language and we can destroy parameters and type of return.
    Because in the toFilterCars made return of type datas
*/

print(toFilterCars(cars: newCars, filter: { price in
    price <= 500000
}))

print(toFilterCars(cars: newCars, filter: { price in
    price > 500000
}))

// MARK: - The fourth Attempt of the Closure (make very small code)

//  We can destroy parameter and word "in" because we can use $0(first parametr), $1(second parametr) etc.

print(toFilterCars(cars: newCars, filter: { $0 <= 500000 }))

print(toFilterCars(cars: newCars, filter: { $0 > 500000 }))

/*                              These
                                were
                                inline
                                closures
*/

// MARK: - Trailing closures

/*
    If our func has on last parameter is func(in our example is filter {})
*/
print(toFilterCars(cars: newCars) {
    $0 <= 500000
})

print(toFilterCars(cars: newCars) { $0 > 500000 })

// MARK: - Example with datas in closure

func checkData(success: (_ result: String)->(), notSuccess: (_ error: String)->()){
    // Here is a request..
    
    let response = false
    response ? success("Success") : notSuccess("Fail")
}

checkData(success: { result in
    print(result)
}) { result in
    print(result)
}


// MARK: - Repeat the topic

func operationWithNumbers(_ array: [Int], _ theFunc: (Int)->Bool) -> [Int] {
    var newArray: [Int] = []
    
    for checkEveryNumber in array {
        if theFunc(checkEveryNumber) {
            newArray.append(checkEveryNumber)
        }
    }
    return array
}


func splitEvenNumbers(_ number: Int)->Bool{
    number % 2 == 0 ? true : false
}

let arrayWithAnotherNumbers = [1,2,3,4,5,6,7,8,9]

operationWithNumbers(arrayWithAnotherNumbers, splitEvenNumbers(_:))
