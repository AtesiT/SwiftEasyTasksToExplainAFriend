import UIKit

//: # Home Work 7

/*:
 ## Задание 1

 1. Создайте класс `Student`. В этом классе должны быть следующие свойства:
    - `name: String`: Имя студента. Это свойство должно быть инициализировано при создании объекта класса.
    - `age: Int`: Возраст студента. Это свойство также должно быть инициализировано при создании объекта класса.
    - `grades: [Int]`: Оценки студента.
    - `averageGrade Double`: Средний балл студента. Это свойство должно быть геттером.
    - `description: String`: Статус студента. Это свойство должно быть геттером и возращать следующее значение: "<имя>: <средний бал>, <статус>"

 2. В классе должен быть метод `getStatus`, который возвращает статус студента на основе его среднего балла. Правила следующие:
    - Если средний балл 0, то статус - "New".
    - Если средний балл между 1 и 3, то статус - "Underperforming".
    - Если средний балл между 4 и 6, то статус - "Average".
    - Если средний балл между 7 и 8, то статус - "Good".
    - Если средний балл между 9 и 10, то статус - "Excellent".

 3. В классе должен быть метод `addGrade`, который добавляет оценку к списку оценок студента.
 
 У класса должен быть согласованный и логичный интерфейс. Не забывайте про инкапсуляцию.

 Проверьте ваш код, создав несколько объектов класса `Student` и вызывая метод `addGrade()` для добавления оценок. Выведите на экран имя студента, его средний балл и статус.

 **Бонусное задание:**
 Создайте класс `Classroom` со свойством `students`, представляющим собой массив объектов класса `Student`. Реализуйте метод `addStudent` для добавления студентов в список. Так же реализуйте метод `getAverageGrade()`, который вычисляет средний балл всех студентов в классе.
 
 Предусмотрите возможность создания экземпляра класса, как с пустым списком учеников, так и с возможностью передать готовый список в инициализатор.
 
 */
func averageNumber(array: [Int]) -> Int {
    var sumOfNumberInArray: Int = 0
    var countOfNumbersInArray: Int = 0
    
    for everyNumber in array {
        sumOfNumberInArray += everyNumber
        countOfNumbersInArray += 1
    }
    return countOfNumbersInArray > 0 ? sumOfNumberInArray / countOfNumbersInArray : 0
}

class Student {
    var name: String
    var age: Int
    private var grades: [Int]
    //var description: String
    
    init(name: String, age: Int){
        self.name = name
        self.age = age
        self.grades = []
    }
    var averageGrade: Double {
        return Double(averageNumber(array: grades))
    }
    
    func getStatus() -> String {
        var status: String
        var score = averageGrade
        
        switch score {
            case 0:
                status = "New"
            case 1...3:
                status = "Underperforming"
            case 4...6:
                status = "Average"
            case 7...8:
                status = "Good"
            default:
                status = "Excellent"
        }
        return status
    }
    
    func addGrade(grade: Int){
        self.grades.append(grade)
    }
}

var firstStudent = Student(name: "Alex", age: 30)
firstStudent.addGrade(grade: 10)
print(firstStudent.getStatus())
/*:
 ## Задание 2
 2.1 Создайте класс `Employee` (сотрудник) со следующими свойствами:
 
 - `salary`
 
 - `name`
 
 - `surname`
 */

class Employee {
    var salary: Int
    var name: String
    var surname: String
    
    init(name: String, surname: String, salary: Int) {
        self.name = name
        self.surname = surname
        self.salary = salary
    }
}
 
//: 2.2 Создайте массив `names` со следующими именами: *John*, *Aaron*, *Tim*, *Ted*, *Steven*. И еще один массив `surnames` со следующими фамилиями: *Smith*, *Dow*, *Isaacson*, *Pennyworth*, *Jankins*. Массивы должны быть созданы вне класса.

var names: [String] = ["John", "Aaron", "Tim", "Ted", "Steven"]
var surnames: [String] = ["Smith","Dow","Isaacson","Pennyworth","Jankins"]

//: 2.3 Объявите массив `employees` и создайте цикл, в котором он заполняется десятью объектами класса `Employee` таким образом, что свойства `name` и `surname` инициализируются случайными именами и фамилиями из массивов `names` и `surnames`, соответственно. Свойство `salary` (зарплата) тоже должно генерироваться в случайном диапазоне от *$1000* до *$2000*
var employees: [Employee] = []

for _ in 1...10 {
    var randomName = names.randomElement()!
    var randomSurname = surnames.randomElement()!
    var randomSalary = Int.random(in: 1000...2000)
    var newEntry = Employee(name: randomName, surname: randomSurname, salary: randomSalary)
    
    employees.append(newEntry)
}


//: 2.4 Переберите массив `employees` и выведите информацию по каждому сотруднику в виде: «<имя> <фамилия>’s salary is $<... >»

for checkEveryEmployee in employees {
    print("\(checkEveryEmployee.name) \(checkEveryEmployee.surname)'s salary is $\(checkEveryEmployee.salary)")
}


//: 2.5 Создайте еще один массив на основе `employees`, который включает только тех работников, чья зарплата чётная. Выведите информацию по каждому сотруднику с четной зарплатой, как в пункте 2.4
var arrayWithEvenSalary: [Employee] = [] 

for checkEveryEmployee in employees {
    if checkEveryEmployee.salary % 2 == 0 {
        arrayWithEvenSalary.append(checkEveryEmployee)
        print("\(checkEveryEmployee.name) \(checkEveryEmployee.surname)'s even salary is $\(checkEveryEmployee.salary)")
    }
}
