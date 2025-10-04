import UIKit

/*:
 ## Задание 1
 
 Напишите функцию, которая принимает массив чисел и замыкание, определяющее условие фильтрации. Функция должна вернуть новый массив, содержащий только те элементы, которые удовлетворяют условию замыкания. Не используйте стандартную функцию `filter(_:)`.

Пример использования вашей функции:
 */

//let numbers = [1, 2, 3, 4, 5, 6, 7, 8, 9]
//let evenNumbers = customFilter(numbers) { $0 % 2 == 0 }
//print(evenNumbers) // Вывод: [2, 4, 6, 8]

func customFilter(array: [Int], myFunc: (Int) -> Bool) -> [Int] {
    var newArrayToReturn = [Int]()
    
    for everyNumber in array {
        if myFunc(everyNumber){
            newArrayToReturn.append(everyNumber)
        }
    }
    return newArrayToReturn
}

func theFuncToCheckNumberEvenOrOdd(theNum: Int) -> Bool {
     theNum % 2 == 0
}

var arrayForExample = [1,2,3,4,5,6,7,8,9]

print(customFilter(array: arrayForExample, myFunc: theFuncToCheckNumberEvenOrOdd(theNum:)))
/*:
 ## Задание 2
 
 Напишите функцию, которая принимает строку и замыкание, которое преобразует каждый символ строки. Функция должна вернуть новую строку, состоящую из преобразованных символов.

Пример использования вашей функции:
 */

//let originalString = "Hello, World!"
//let uppercasedString = transformString(originalString) { $0.uppercased() }
//print(uppercasedString) // Вывод: "HELLO, WORLD!"

func uppercasedString(string: String, theFunc: (String) -> String) -> String {
    var theWordForReturn = ""
    
    for everySymbol in string {
        let everySymbolInTypeOfString = String(everySymbol)
        theWordForReturn.append(upperString(theWord: everySymbolInTypeOfString))
    }
    return theWordForReturn
}

func upperString(theWord: String) -> String {
    theWord.uppercased()
}

print(uppercasedString(string: "Hello", theFunc: upperString(theWord:)))
/*:
 ## Задание 3
 
 Создайте функцию, которая генерирует массив случайных чисел в заданном диапазоне. Функция должна принимать начальное и конечное значения диапазона, а также количество чисел, которые нужно сгенерировать. В качестве дополнительного параметра функция должна принимать замыкание, которое выполняет какую-либо операцию над каждым сгенерированным числом (например, увеличивает его на 1 или умножает на 2). Функция должна вернуть массив преобразованных чисел.

Пример использования вашей функции:
 */

//let randomNumbers = generateRandomNumbers(from: 1, to: 100, count: 10) { $0 * 2 }
//print(randomNumbers) // Вывод: [32, 12, 86, 46, 6, 62, 82, 76, 48, 70] (результат будет другим из-за случайности чисел)

func createRandomNumbers(from: Int, to: Int, count: Int, funcToMakeSmthWithNumber: (Int) -> Int) -> [Int]{
    var i = 0
    var arrayToReturn: [Int] = []
    
    while i < count {
        let newNumber = Int.random(in: from...to)
        arrayToReturn.append(funcToMakeSmthWithNumber(newNumber))
        i+=1
    }
    return arrayToReturn
}

func toMultiplyNumber(int: Int, multiply: Int) -> Int {
    return int * multiply
}

func toSumNumber(int: Int, sum: Int) -> Int {
    return int + sum
}

print(createRandomNumbers(from: 1, to: 10, count: 5, funcToMakeSmthWithNumber: {toSumNumber(int: $0, sum: 1)))
