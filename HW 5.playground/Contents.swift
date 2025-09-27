import UIKit

//: # Home Work 5
/*:
 ## Задание 1
 Создайте словарь, который содержит результаты игр спортивной команды. Ключом словаря должно быть название команды соперника, а в качестве значения должен быть массив с результатами игр с этим соперником. Необходимо вывести на консоль результаты игр. Выглядеть это должно примерно следующим образом:
 
 - Игра с Салават Юлаев - 3:6
 
 - Игра с Салават Юлаев - 5:5
 
 - Игра с Салават Юлаев - N/A
 
 - Игра с Авангард - 2:1
  
 - Игра с АкБарс - 3:3
 
 - Игра с АкБарс - 1:2
 */
var dictionaryAResultsOfGame: [String: [String]] = [
    "Авангард": ["2:1"],
    "АкБарс": ["3:3", "1:2"]
]

for (everyKey, everySign) in dictionaryAResultsOfGame {
    print("Игра с \(everyKey) - \(everySign)")
}

/*:
 ## Задание 2
 Создайте функцию, которая считает общую сумму переданных в нее целочисленных значений и возвращает итоговый результат. Числа можно передавать либо в массиве, либо по отдельности, на ваше усмотрение. Вызовите функцию.
 */

func countOfSum(theArray: [Int]) -> Int {
    var countOfSumNumbers = 0
    
    for everyNumberFromArray in theArray {
        countOfSumNumbers += everyNumberFromArray
    }
    return(countOfSumNumbers)
}

print(countOfSum(theArray: [1,2,3]))


/*:
 ## Задание 3
 3.1 Создайте функцию, которая определяет является ли число четным. В случае, если число является четным, функция должна возвращать `true`. Иначе - `false`.
 */
func isItEven(int: Int) -> Bool {
    if (int % 2 == 0) {
        return true
    } else {return false}
}

print(isItEven(int: 4))

/*:
3.2 Создайте функцию, которая определяет делится ли число на *3* без остатка. Функция так же должна возвращать булево значение.
*/

func isItDivideOnThreeNumber(theNumber: Int) -> Bool {
    if (theNumber % 3 == 0) {
        return true
    } else {
        return false
    }
}

print(isItDivideOnThreeNumber(theNumber: 6))
/*:
 3.3 Создайте функцию, которая возвращает возрастающий массив чисел в интервале от *x* до *y*. Данный интервал должен задаваться при вызове функции при помощи параметров. Вы должны самостоятельно реализовать логику создания массива. Если хотите усложнить задание, то можете возвращать не сортированный массив чисел в заданном интервале. Главное, что бы числа были уникальными и не повторялись. При этом количество элементов массива должно соответствовать количеству элементов заданного интервала.
 */
func checkToCreateNotRepeatNumber(yourArrayToCheck: [Int]) -> Int {
    var newNumber: Int
    
    repeat {
        newNumber = Int.random(in: Int.min...Int.max)
    } while yourArrayToCheck.contains(newNumber)
    
    return newNumber
}

func createArray(x: Int, y: Int) -> [Int] {
    var returnArray = [Int]()
    
    for _ in x...y {
        returnArray.append(checkToCreateNotRepeatNumber(yourArrayToCheck: returnArray))
    }
    
    return returnArray
}

Array(1...10) // Не использовать

/*:
3.4 Создайте массив чисел от *1* до *100*, используя для этого выше созданную функцию
 */

var newArrayOfNumbers = createArray(x: 1, y: 10)
print(newArrayOfNumbers)

/*:
 3.5 Создайте функцию для фильтрации переданного в неё массива. Функция должна возвращать новый массив без четных чисел. Для определения фильтруемых значений используйте ранее созданную функцию из задания **3.1**.
 */

func toFilterTheArrayOnOddNumber(toCheckArray: [Int]) -> [Int]{
    var newArrayToReturn: [Int] = []
    for everyNumberOfArray in toCheckArray {
        if (!isItEven(int: everyNumberOfArray)) {
            newArrayToReturn.append(everyNumberOfArray)
        }
    }
    
    return newArrayToReturn
}

print(toFilterTheArrayOnOddNumber(toCheckArray: [1,2,3,4,5]))


func toDeleteNumbersThatCanBeDividedOnThree(array: [Int]) -> [Int]{
    var arrayToReturn: [Int] = []
    
    for everyNumber in array {
        if (!isItDivideOnThreeNumber(theNumber: everyNumber)) {
            arrayToReturn.append(everyNumber)
        }
    }
    
    return arrayToReturn
}

print(toDeleteNumbersThatCanBeDividedOnThree(array: [1,3,6,9]))
/*:
 3.7 Отфильтруйте массив из задания **3.4** при помощи двух последний функций.
 */
print(toFilterTheArrayOnOddNumber(toCheckArray: newArrayOfNumbers))
print(toDeleteNumbersThatCanBeDividedOnThree(array: newArrayOfNumbers))
