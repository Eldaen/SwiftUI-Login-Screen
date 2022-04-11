//
//  MainScreenViewModel.swift
//  VkClientSwiftUI
//
//  Created by Денис Сизов on 11.04.2022.
//

import Foundation

/// Вью модель основного экрана
final class MainScreenViewModel {
	
	/// Сервис для загрузки пользователей
	let userService: UserService
	
	// MARK: Init
	
	init(userService: UserService) {
		self.userService = userService
	}
}
