//  Дан массив целых чисел. Нужно вернуть сумму чисел, которые встречаются в массиве ровно один раз.

//    Условия
//
//    Вход: массив Int.
//    Выход: Int — сумма элементов, встречающихся однократно.

//    Пример
//
//    Вход: [1, 2, 3, 2, 4, 1, 5]
//    Выход: 3 + 4 + 5 = 12

func findUniqueNumbersInArrayAndReturnSum(anyArray array: [Int]) -> Int {
    var theUniqueNumbersInArray: [Int] = []
    
    for checkEveryNumber in array {
        if !theUniqueNumbersInArray.contains(checkEveryNumber) {
            theUniqueNumbersInArray.append(checkEveryNumber)
        } else {
            var i = 0
            while i < theUniqueNumbersInArray.count {
                if theUniqueNumbersInArray[i] == checkEveryNumber {
                    theUniqueNumbersInArray.remove(at: i)
                }
                i+=1
            }
        }
    }
    return theUniqueNumbersInArray.reduce(0, +)
}

print(findUniqueNumbersInArrayAndReturnSum(anyArray: [1, 2, 3, 2, 4, 1, 5]))
