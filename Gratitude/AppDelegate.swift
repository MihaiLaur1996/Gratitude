//
//  AppDelegate.swift
//  Gratitude
//
//  Created by Mihai Mocanu on 21.12.2022.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {
    var window: UIWindow?
    
    private var coordinator: Coordinator?
    
    func application(
        _ application: UIApplication,
        didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?
    ) -> Bool {
        let newWindow = UIWindow(frame: UIScreen.main.bounds)
        self.window = newWindow
        window?.makeKeyAndVisible()
        coordinator = Coordinator(window: window)
        
        return true
    }
}
