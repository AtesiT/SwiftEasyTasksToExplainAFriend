let items: [Any] = [1.25, 5.0, 5, 1, "Tim", true]
let itemsArray: [String: Any] = ["name": "Ann",
                                 "age": 25,
                                 "isStudent": true]

for anyItem in items {
    if let anyItem = anyItem as? Int {
        print("\(anyItem) has a integer type")
    } else if let anyItem = anyItem as? Bool {
        print("\(anyItem) has a Bool type")
    } else if let anyItem = anyItem as? String {
        print("\(anyItem) has a String type")
    } else {
        print("\(anyItem) has a Float type")
    }
}

print("\n\n\n")


for (_, anyItem) in itemsArray {
    if let anyItem = anyItem as? Int {
        print("\(anyItem) has a integer type")
    } else if let anyItem = anyItem as? Bool {
        print("\(anyItem) has a Bool type")
    } else if let anyItem = anyItem as? String {
        print("\(anyItem) has a String type")
    } else {
        print("\(anyItem) has a Float type")
    }
}
