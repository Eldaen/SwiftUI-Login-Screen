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
	let link: String
	
	var imageUrl: URL? {
		URL(string: link)
	}
}
