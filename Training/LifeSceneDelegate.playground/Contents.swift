/*
                                                                Жизненный
                                                                    цикл
                                                                    приложения
 
                    Управляет одной или несколькими сценами приложения
 */
import UIKit

final class SceneDelegate: UIResponder, UIWindowSceneDelegate {
    var window: UIWindow?
    
    //  Метод ниже вызывается, после вызова didFinishLaunchingWithOptions из AppDelegate
    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        //  В этом методе происходит глобальная конфигурация приложения
        //  Настройка общего дизайна приложения (NavController, TabBarController etc.)
        //  Чтобы каждый раз не настраивать цвета для каждого Controller, можно один раз задать глобально.
        
        //  Можно определять стартовый ViewController, если работа происходит без Storyboard
        //  В этом методе происходит инициализация push-уведомлений. (спрашиваем разрешение на отправку push-уведомлений)
        
        //  Пример создания приложения с помощью кода
        UIView.appearance().tintColor = .white
        //  Меняем глобально цвет кнопки на белый
        
        //  Меняем navigationBar
        let navBarAppearance = UINavigationBarAppearance()
        navBarAppearance.titleTextAttributes = [.foregroundColor: UIColor.white]
        navBarAppearance.backgroundColor = .systemGray
        //  После настройки, нам необходимо присвоить
        UINavigationBar.appearance().scrollEdgeAppearance = navBarAppearance
    }
    //  После этого метода, вызывается метод sceneWillEnterForeground для перехода в активное состояние
    func sceneWillEnterForeground(_ scene: UIScene) {
        //  Подготавливаем интерфейс к отображению (к примеру подготовить элементы интерфейса)
    }
    //  После метода sceneWillEnterForeground вызывается метод sceneDidBecomeActive
    func sceneDidBecomeActive(_ scene: UIScene) {
        //  Константирует тот факт, что приложение запущено
        //  Здесь мы запускам анимации, видео и так далее
    }
    //  После предыдущего метода, запускается метод sceneWillResignActive для перехода приложения из активного состояния в фоновое состояние.
    func sceneWillResignActive(_ scene: UIScene) {
        //  Служит для того, чтобы отменить активности выше из метода sceneDidBecomeActive
        //  Срабатывает даже, если просто захотеть свернуть приложение (снизу вверх свайп начать делать)
        //  Если не сворачивать приложение(попытаться свернуть, лишь делать свайп), а обратно открыть - то вернёмся к методу sceneDidBecomeActive
    }
    //  После предыдущего метода, приложение переходит в работу в фоновом режиме
    func sceneDidEnterBackground(_ scene: UIScene) {
        //  Здесь мало какие-активности можно задать приложению (К примеру: Фоновая музыка, режим сети background(когда нет apps активно использующих эту сеть))
        //  В этом методе происходит обращение к БД. Чтобы сохранить состояние последнее в БД.
        //  Если много активностей здесь будет, то iOS "отключит" работу приложения
    }
    
}
