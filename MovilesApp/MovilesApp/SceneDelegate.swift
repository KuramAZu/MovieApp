//
//  SceneDelegate.swift
//  MovilesApp
//
//  Created by Domingo on 24/Feb/2023.
//

import UIKit


 class SceneDelegate: UIResponder, UIWindowSceneDelegate {

     var window: UIWindow?

    // var listOfMoviesRouter = ListOfMoviesRouter()
         
     func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
         guard let windowScene = (scene as? UIWindowScene) else { return }
         let window = UIWindow(windowScene: windowScene)
         
         let vc = LoginViewController()
         let nav = UINavigationController(rootViewController: vc)
         nav.modalPresentationStyle = .fullScreen
         
         window.rootViewController = nav
         self.window = window
         self.window?.makeKeyAndVisible()
         //MARK: DESCOMENTO EL CODIGO Y ME DIRIGE A LA APP DE PELICULAS 
         //listOfMoviesRouter.showList(fromViewController: <#T##UIViewController#>)
     }
 }

