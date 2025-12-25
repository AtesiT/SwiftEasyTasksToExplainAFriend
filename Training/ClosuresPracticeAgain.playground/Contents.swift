//  MARK: - PRACTICE WITH CLOSURES AGAIN

func sumNumberFiveTimesOnSelf(_ number: Int, completion: (Int) -> ())  {
    var theNumber = 0
    
    for _ in 1...5 {
        theNumber += number
        completion(theNumber)
    }
}

sumNumberFiveTimesOnSelf(3) { result in
    print(result)
}

//  MARK: - MADE WITH ESCAPING ON OTHER THREAD

import UIKit

func sumTheNumber(number theNumber: Int, count times: Int, completion: @escaping (Int) -> ()) {
    
    var result = 0
    
    print("The beggining of the function")
    
    DispatchQueue.global().async {
        for _ in 1...times {
            result += theNumber
            completion(result)
        }
    }
    
    print("The end of the function")
}

sumTheNumber(number: 5, count: 5) { result in
    print(result)
}
