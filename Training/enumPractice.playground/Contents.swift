enum Laptops {
    case Macbook(type: Version)
    case Dell
    case Microsoft
    
    enum Version: String {
        //  We set inherit from class "String"
        case Air = "Air M4"
        case Normal = "A18 Pro"
        case Pro = "Pro M5"
    }
    
    var title: String {
        switch self {
        case Laptops.Macbook:   //  Can just a .Macbook
            return "Your laptop is Macbook"
        case Laptops.Dell:      //  Can just a .Dell
            return "Your laptop is Dell"
        case Laptops.Microsoft: //  Can just a .Microsoft
            return "Your laptop is Microsoft"
        }
    }
}

let laptop: Laptops = Laptops.Dell // Can just a .Dell
print(laptop)
print(laptop.title)

/*
                After update case Macbook (was added type: Price)
*/

let newLaptop: Laptops = .Macbook(type: Laptops.Version.Air)  //  Can just a .Air

switch newLaptop {
case Laptops.Macbook(let macVersion) where macVersion == .Air:
    print("Your Macbook has \(Laptops.Version.Air.rawValue) version. Price of 999$") // RawValue was added to displays the String
case Laptops.Macbook(type: .Pro):
    print("Your Maxbook has \(Laptops.Version.Pro) version. Price of 1299$")
case Laptops.Dell:
    print(laptop.title)
case Laptops.Microsoft:
    print(laptop.title)
default:
    print("You have no laptop")
}


/*
            Just a test with enum rawValue
*/

enum Phone: String {
    case iPhone = "17 Pro", Samsung = "S25", Pixel = "10"
}

let myPhone = Phone(rawValue: "17 Pro")
print(myPhone?.rawValue ?? "Not found")
//  Optional 'cause we can have mistake with name/existing




/*
                                        Practice
                                          Self
                                           To
                                         Repeat
                                        The topic
*/


enum Cars {
    case Sportcar(type: Cars.SportcarModel)
    case Hatchback(price: Cars.HatchbackPrice)
    case SUV
    
    enum SportcarModel: String {
        case Lamborghini = "Lamborghini Huracan"
        case Ferrari = "Ferrari 2025"
        case Bugatti = "Bugatti Chiron"
    }
    
    enum HatchbackPrice {
        case Million, Billion
    }
}

let newCarFromHangar = Cars.SUV
print(newCarFromHangar)

let newCarFromOnlineStore = Cars.Hatchback(price: .Billion)
print(newCarFromOnlineStore)


enum TV: Int {
    //  Numbers will be inch of TV
    case LG     = 30
    case Sony   = 44
}

let newTV = TV(rawValue: 30)
print(newTV ?? "No TV")




/*
                                        Practice
                                         Again
                                          But
                                          With
                                         Switch
*/


enum Fruits {
    case Apple(color: colorOfFruit), Banana, Orange
    
    enum colorOfFruit {
        case green
        case yellow
        case red
    }
}

let fruitOnTable = Fruits.Apple(color: .red)

switch fruitOnTable {
case .Apple(let color) where color == .red:
    print("This is a red apple")
case .Apple(let color) where color == .green || color == Fruits.colorOfFruit.yellow:
    print("This is a green or yellow apple")
case .Banana:
    print("This is a banana")
case .Orange:
    print("This is an orange")
default:
    print("If you see this, something went wrong")
}


