//    Дан массив Int nums. Верните индекс первого уникального элемента (тот, который встречается ровно один раз). Если такого нет — вернуть -1.
//
//    Примеры:
//    nums = [2,2,3,4,3] -> 3 (nums[3] == 4)
//    nums = [1,2,2,1] -> -1
//    nums = [7] -> 0


func findUniqueNumber(theArray nums: [Int]) -> Int {
    
    var theNumbersArray = nums
    var countNumbers: Int = 0
    var theIndex: Int = 0
    
    for number in nums {
        countNumbers = 0
        
        for checkEveryNumber in theNumbersArray {
            if (number == checkEveryNumber) {
                countNumbers += 1
            }
        }
        if (countNumbers <= 1) {
            return theIndex
        }
        theIndex += 1
    }
    return -1
}

print(findUniqueNumber(theArray: [2,2,3,4]))
