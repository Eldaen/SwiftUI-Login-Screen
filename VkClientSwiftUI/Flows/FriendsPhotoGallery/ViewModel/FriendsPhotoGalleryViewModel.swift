//
//  FriendsPhotoGalleryViewModel.swift
//  VkClientSwiftUI
//
//  Created by Денис Сизов on 11.04.2022.
//

import Foundation

/// Вью модель для галлереи фотографий пользователя
final class FriendsPhotoGalleryViewModel: ObservableObject {
	
	/// Выбранное фото пользователя
	@Published var photo: FriendImage
	
	// MARK: Init
	
	init(currentPhoto: FriendImage) {
		self.photo = currentPhoto
	}
}
