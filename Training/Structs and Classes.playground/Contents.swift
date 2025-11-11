// MARK: Practice with use structs and classes

// Init
struct Building {
    var price: Int
    func recognizePrice() -> Int {
        return price
    }
    
    init(price: Int) {
        self.price = price
    }
}

let buildingOne = Building(price: 5000)
print(buildingOne.recognizePrice())
print(buildingOne.price)



