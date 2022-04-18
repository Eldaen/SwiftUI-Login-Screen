//
//  FriendsPhotoGalleryViewModel.swift
//  VkClientSwiftUI
//
//  Created by Денис Сизов on 11.04.2022.
//

import Foundation
import SwiftUI

/// Вью модель для галлереи фотографий пользователя
final class FriendsPhotoGalleryViewModel: ObservableObject {
	
	/// Выбранное фото пользователя
	@Published var photo: FriendImage
	@Published var likeFlag: Bool
	
	/// Сервис для управления лайками фото
	let imageLikesService: ImageLikeService
	
	// MARK: Init
	
	init(currentPhoto: FriendImage, imageLikeService: ImageLikeService) {
		self.photo = currentPhoto
		self.imageLikesService = imageLikeService
		self.likeFlag = currentPhoto.userLikes == 1 ? true : false
	}
	
	/// Ставит лайк на фотографию
	func setLike() {
		imageLikesService.setLike(by: self.photo.ownerId, for: self.photo.photoId) { [weak self] result in
			self?.photo.likesCount = result
			self?.photo.userLikes = 1
			self?.likeFlag.toggle()
		}
	}
	
	/// Убирает лайк с фотографии
	func removeLike() {
		imageLikesService.removeLike(by: self.photo.ownerId, for: self.photo.photoId) { [weak self] result in
			self?.photo.likesCount = result
			self?.photo.userLikes = 0
			self?.likeFlag.toggle()
		}
	}
}
