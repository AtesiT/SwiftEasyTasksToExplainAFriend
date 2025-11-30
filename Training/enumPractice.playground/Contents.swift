enum Laptops {
    case Macbook(type: Version)
    case Dell
    case Microsoft
    
    enum Version {
        case Air
        case Normal
        case Pro
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
    print("Your Macbook has \(Laptops.Version.Air) version. Price of 999$")
case Laptops.Macbook(type: .Pro):
    print("Your Maxbook has \(Laptops.Version.Pro) version. Price of 1299$")
case Laptops.Dell:
    print(laptop.title)
case Laptops.Microsoft:
    print(laptop.title)
default:
    print("You have no laptop")
}


