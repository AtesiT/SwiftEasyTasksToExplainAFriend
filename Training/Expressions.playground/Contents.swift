import Foundation

// ^ = first symbol, $ = last symbol
// . = any symbol
// \s = tab,space,enter
// \t = tab
// \w = underscopes, letters, digits
// \d = any digit

// \S \W \D - opposite actions



let word = "any word"
if let range = word.range(of: "\\w+", options: .regularExpression) {
    print("Found word: \(word[range])")
} else {
    print("No word found")
}

let digits = "hi this is text 4 u"
if let rangeDigits = digits.range(of: "\\d+", options: .regularExpression) {
    print("The number is \(digits[rangeDigits])")
} else {
    print("No digits found")
}


