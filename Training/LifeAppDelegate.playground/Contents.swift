/*
                                                                Жизненный
                                                                    цикл
                                                                    приложения
 */
import UIKit
final class AppDelegate: UIResponder, UIApplicationDelegate {
    /*
           Жизенный цикл приложения начинается с этого метода
           (вызывается сразу после того, как приложение загружается в память)
           После того, как пользователь нажимает на иконку приложения, первое что видит пользователь - LaunchScreen.
           
    */
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        //      После того, как приложение загрузилось в память и доступен код - получаем уведомление от этого метода
        true
    }
    //  Далее, вызывается метод willConnectTo из SceneDelegate
    
//    func application(sceneDidDiscardScenesSession) 
    
    //  Данный метод вызывается редко (если самостоятельно закрыть приложение, оно будет выгружено из памяти)
    func application(_ application: UIApplication, didDiscardSceneSessions sceneSessions: Set<UISceneSession>) {
        //  В этом методе происходит обращение к БД. Чтобы сохранить состояние последнее в БД.
    }
}

print(#function)
