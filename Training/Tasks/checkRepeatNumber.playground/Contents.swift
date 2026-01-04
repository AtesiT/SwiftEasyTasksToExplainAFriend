//    Дан массив Int nums. Верните true, если в массиве есть два одинаковых элемента (повтор), иначе false.
//    
//    Примеры:
//    nums = [1,2,3,1] -> true
//    nums = [1,2,3,4] -> false
//    nums = [] -> false

func findRepeatNumber(theArray nums: [Int]) -> Bool {
    var theNumbersInArray: [Int] = []
    
    for number in nums {
        if !theNumbersInArray.contains(number) {
            theNumbersInArray.append(number)
        } else {
            return true
        }
    }
    return false
}

print(findRepeatNumber(theArray: [1,2,3,1]))
print(findRepeatNumber(theArray: [1,2,3,4]))
