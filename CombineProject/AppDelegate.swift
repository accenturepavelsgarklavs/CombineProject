//
//  AppDelegate.swift
//  CombineProject
//
//  Created by pavels.garklavs on 16/03/2022.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    private var navigationController: UINavigationController?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        window = UIWindow(frame: UIScreen.main.bounds)
        window?.makeKeyAndVisible()

        navigationController = UINavigationController(rootViewController: makeCombineViewController())
        
        window?.rootViewController = navigationController
        
        return true
    }

}

private extension AppDelegate {
    func makeCombineViewController() -> UIViewController {
        let controller = CombineViewController()
        let viewModel = CombineViewModel()
        
        controller.configure(viewModel: viewModel)
        
        return controller
    }
}

