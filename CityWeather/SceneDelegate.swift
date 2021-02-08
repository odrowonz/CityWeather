//
//  SceneDelegate.swift
//  CityWeather
//
//  Created by Andrey Antipov on 17.01.2021.
//

import UIKit

@available(iOS 13, *)
class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?

    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        if let windowScene = scene as? UIWindowScene {
            self.window = UIWindow(windowScene: windowScene)

            let vm = CityViewModel()
            let vc = CityViewController(output: vm)

            self.window?.rootViewController = vc
            self.window?.makeKeyAndVisible()
            self.window?.backgroundColor = .red
        }
    }
}



