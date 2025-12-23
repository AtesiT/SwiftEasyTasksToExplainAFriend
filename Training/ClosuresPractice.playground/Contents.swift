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

