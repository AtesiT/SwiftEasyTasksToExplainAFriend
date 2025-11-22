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
    // Делаем класс Сингельтоном (но для этого недостаточно написть лишь static let...)
    static let shared = StorageManager()
    private let datastore = DataStore.shared
    // Нужно добавить приватный инициализатор
    private init () {}
    
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

let storageManagerOne = StorageManager.shared
storageManagerOne.addName(addedName: "Rick")
storageManagerOne.getNames()

print("\n\n\n")

let storageManagerTwo = StorageManager.shared
storageManagerTwo.addName(addedName: "Rihanna")
storageManagerTwo.getNames()





// MARK: - Практика с созданием. Повторение всего того, что выше


final class NewDataStore {
    static let shared = NewDataStore()
    private init() {}
}

final class NewDataStoreManager {
    static let shared = NewDataStoreManager()
    private let newDataStore = NewDataStore.shared
    private init() {}
}
