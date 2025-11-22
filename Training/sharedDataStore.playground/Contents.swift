final class DataStore {
    
    static let shared = DataStore()
    
    var name = [
        "Alex",
        "John"
    ]
    
    var surname = [
        "Jobs",
        "Snow"
    ]
    
    private init() {}
}

final class StorageManager {
    private let datastore = DataStore.shared
    
    func addName(addedName: String) {
        if !datastore.name.contains(addedName) {
            datastore.name.append(addedName)
        }
    }
    
    func addSurname(addSurname: String) {
        if !datastore.surname.contains(addSurname) {
            datastore.surname.append(addSurname)
        }
    }
    
    func getNames() {
        datastore.name.forEach { print($0) }
    }
    
    func getSurnames() {
        datastore.surname.forEach { print($0) }
    }
}

let storageManagerOne = StorageManager()
storageManagerOne.addName(addedName: "Rick")
storageManagerOne.getNames()

print("\n\n\n")

let storageManagerTwo = StorageManager()
storageManagerTwo.addName(addedName: "Rihanna")
storageManagerTwo.getNames()






