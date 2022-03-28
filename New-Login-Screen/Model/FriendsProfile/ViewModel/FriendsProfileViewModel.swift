//
//  FriendsProfileViewModel.swift
//  VK client
//
//  Created by Денис Сизов on 26.11.2021.
//

import UIKit.UIImage
import Combine

/// Протокол вью модели для FriendsProfile
protocol FriendsProfileViewModelType {
	
	/// Модель друга, чей профиль загружаем
	var friend: Friend { get set }
	
	/// Ссылки на картинки пользователя
	var storedImages: [FriendImage] { get }
	
	/// Загруженные модели картинок
	var storedModels: [ApiImage] { get }
	
	/// Сервис по загрузке данных пользователя
	var loader: UserLoader { get }
	
	/// Загружает картинки
	func fetchPhotos(completion: @escaping () -> Void)
	
	init(friend: Friend, loader: UserLoader)
}

final class FriendsProfileViewModel: FriendsProfileViewModelType, ObservableObject {
	
	@Published var friend: Friend
	@Published var storedImages: [FriendImage] = []
	
	var storedModels: [ApiImage] = []
	var loader: UserLoader
	
	init(friend: Friend, loader: UserLoader){
		self.friend = friend
		self.loader = loader
	}
	
	func fetchPhotos(completion: @escaping () -> Void) {
		loader.loadUserPhotos(for: String(friend.id)) { [weak self] images in
			self?.storedModels = images
			
			if let imagesLinks = self?.loader.sortImage(by: "m", from: images) {
				
				self?.storedImages = imagesLinks.map { FriendImage(link: $0) }
			}
			completion()
		}
	}
	
	func getFriendsCount(completion: @escaping (Int) -> Void) {
		loader.getFriendsCount { count in
			completion(count)
		}
	}
}
