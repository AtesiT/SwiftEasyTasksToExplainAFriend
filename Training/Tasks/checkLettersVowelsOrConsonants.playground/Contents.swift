//    Напиши функцию, которая принимает строку и определяет, кого в ней больше: гласных или согласных.
//
//    Условия:
//    Гласные: a, e, i, o, u.
//    Согласные: все остальные буквы латинского алфавита (кроме символов и пробелов).
//
//    Что вернуть: * Если гласных больше — верни строку "Vowels win!"
//    Если согласных больше — верни строку "Consonants win!"
//    Если поровну — верни "Draw!"

func whatIsBiggerVowelsAndConsonants(_ str: String) -> String {
    let allVowels = ["a", "e", "i", "o", "u"]
    var vowelsCount: Int = 0
    var consonantsCount: Int = 0
    
    for character in str {
        if allVowels.contains(String(character)) {
            vowelsCount += 1
        } else {
            consonantsCount += 1
        }
    }
    
    if vowelsCount < consonantsCount {
        return("Consonants win!")
    } else if vowelsCount > consonantsCount {
        return("Vowels win!")
    } else {
        return("Draw!")
    }
}

print(whatIsBiggerVowelsAndConsonants("abc"))
print(whatIsBiggerVowelsAndConsonants("aaabc"))
print(whatIsBiggerVowelsAndConsonants("ab"))
