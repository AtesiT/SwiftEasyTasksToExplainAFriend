func wordPecker(phrase: String, completion: () -> ()) {
    
    for letter in phrase {
        print(letter)
    }
    completion()
}

//wordPecker(phrase: "Hello people! How is it going?") {
//    print("Finish")
//}


//  MARK: - Update the function
func wordPeckerUpdate(phrase: String, wordCompletion: () -> ()) {
    
    let words = phrase.split(separator: " ")
    
    for word in words {
        for letter in word {
            print(letter)
        }
        wordCompletion()
    }
}

//wordPeckerUpdate(phrase: "Hello people! How is it going?") {
//    print("Finish")
//}

func wordPeckerUpdateWithString(phrase: String, wordCompletion: (String) -> ()) {
    
    let words = phrase.split(separator: " ")
    
    for word in words {
        for letter in word {
            print(letter)
        }
        wordCompletion(String(word))
    }
}

wordPeckerUpdateWithString(phrase: "Hello people! How is it going?") { someWord in
    print("--> \(someWord.uppercased()) completed")
}


//  MARK: - ESCAPING
import UIKit

func wordPeckerUpdateWithStringEscaping(phrase: String, wordCompletion: @escaping (String) -> ()) {
    
    let words = phrase.split(separator: " ")
    
    //  Остановка основного блока и вывод сообщения через 2 секунды
    DispatchQueue.main.asyncAfter(wallDeadline: .now() + 2.0) {
        wordCompletion("Finish")
    }
    //  Если что-то выполняется не синхронно, а асинхронно, то необходимо добавить @escaping, иначе сборщик мусора автоматически почистит. Т.к., если система выполнила какой-либо метод, то система чистит мусор(все ссылки). Чтобы такое не случилось, используем @escaping для того, чтобы сообщить сборщику мусора, что необходимо подождать, пока выполнится escaping метод, и только после этого удалять системные методы.
    
    for word in words {
        for letter in word {
            print(letter)
        }
        wordCompletion(String(word))
    }
}

wordPeckerUpdateWithStringEscaping(phrase: "Hello people! How is it going?") { someWord in
    print("--> \(someWord.uppercased()) completed")
}


