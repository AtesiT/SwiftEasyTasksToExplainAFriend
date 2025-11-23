
/*
    Вызывается после десериализации объектов из файла Interface Builder
    (also before life cycle UIViewController)
*/

 override func awakeFromNib() {
    super.awakeFromNib()
}

/*
    Загружает view в память
    Используется только без Storyboard!
    Бесполезен, если используются Storyboards.
*/

override func loadView() {
    //  В этом методе нужно создать кастомное View и инициализировать ее
    //  Задача метода загрузить это кастомное View в память
}


/*
    Вызывается когда view загрузилось в память
 */
override func viewDidLoad() {
    super.viewDidLoad() //  Нужно вызвать эту строку, чтобы были гарантии, что viewController будет функционировать корректно с базовым классом и его функциональностью
    
    //  Сначала необходимо вызвать метод у супер-класса
    //  Метод Super это обращение к родительскому классу и затем вызываем метод viewDidLoad()
}

