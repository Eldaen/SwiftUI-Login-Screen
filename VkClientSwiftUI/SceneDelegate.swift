//
//  SceneDelegate.swift
//  VkClientSwiftUI
//
//  Created by Денис Сизов on 11.04.2022.
//

import UIKit
import SwiftUI

class SceneDelegate: UIResponder, UIWindowSceneDelegate {
	
	var window: UIWindow?
	
	func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
		
		guard let windowScene = scene as? UIWindowScene else { return }
		
		let window = UIWindow(windowScene: windowScene)
		window.rootViewController = UIHostingController(rootView: AppView())
		window.makeKeyAndVisible()
		
		self.window = window
	}
}
