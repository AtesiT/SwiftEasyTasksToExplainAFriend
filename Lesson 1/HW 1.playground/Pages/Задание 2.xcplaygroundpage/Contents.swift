import Foundation

/*:
 ## Задание 2
 
 2.1 Объявите свойство `myAge` и присвойте ему значение вашего возраста.
 */
let myAge: Int8
myAge = 25
/*:
 2.2 Объявите свойство `myAgeInTenYears` и присвойте ему значение вашего возраста через 10 лет (используйте для этого константу `myAge` и оператор сложения).
 */
let myAgeInTenYears: Int8
myAgeInTenYears = myAge + 10

/*:
 2.3 Объявите свойство `daysInYear` и присвойте ему значение **365.25** (число дней в году с учетом високосных годов). Тип данных, которое свойство примет по умолчанию менять не нужно.
 */
let daysInYear = 365.25

/*:
 2.4 Объявите свойство `daysPassed` с типом `Float` и присвойте ему значение количества дней с момента вашего рождения плюс 10 лет (используйте для этого `myAgeInTenYears` и `daysInYear`).
 */
var daysPassed: Double
daysPassed = Double(myAgeInTenYears) * daysInYear


/*:
 2.5 При помощи функции `print()` выведите на консоль фразу: «Мой возраст <...> лет. Через 10 лет, мне будет <...> лет, с момента моего рождения пройдет <...> дней. Символы (<...>) необходимо заменить на значения свойств.
 */
print("My age\(myAge) years. After 10 years i will be \(myAgeInTenYears). Since moment of my birth will pass \(daysPassed) days.")


//: [Ранее: Задание 1](@previous) | Задание 2 из 3 | [Далее: Задание 3](@next)
