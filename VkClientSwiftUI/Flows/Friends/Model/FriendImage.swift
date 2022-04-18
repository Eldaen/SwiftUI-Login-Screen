//
//  FriendImage.swift
//  New-Login-Screen
//
//  Created by Денис Сизов on 24.03.2022.
//

import Foundation

/// Модель картинки галереи пользователя
struct FriendImage: Identifiable {
	var id: String { link }
	let photoId: Int
	let ownerId: Int
	let link: String
	var likesCount: Int
	var userLikes: Int
	
	var imageUrl: URL? {
		URL(string: link)
	}
}
