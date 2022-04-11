//
//  LoginViewModel.swift
//  VkClientSwiftUI
//
//  Created by Денис Сизов on 11.04.2022.
//

import Combine

/// Вью модель авторизации
final class LoginViewModel: ObservableObject {
	
	/// Флаг авторизации пользователя
	@Published var isLoggedIn: Bool = false
	
	/// Изменяет флаг авторизации пользователя на true
	func authorize() {
		if self.isLoggedIn == false {
			self.isLoggedIn = true
		}
	}
	
	/// Разлогинивает пользователя
	func logOut() {
		Session.instance.clean()
		self.isLoggedIn = false
	}
}
