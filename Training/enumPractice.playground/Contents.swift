enum Laptops {
    case Macbook
    case Dell
    case Microsoft
    
    var title: String {
        switch self {
        case Laptops.Macbook:
            return "Your laptop is Macbook"
        case Laptops.Dell:
            return "Your laptop is Dell"
        case Laptops.Microsoft:
            return "Your laptop is Microsoft"
        }
    }
}

print(Laptops.Macbook)
print(Laptops.Macbook.title)
