//
//  ImageLikes.swift
//  VkClientSwiftUI
//
//  Created by Денис Сизов on 18.04.2022.
//

/// Модель лайков картинки пользователя
struct ImageLikes: Codable {
	let count: Int
	let userLikes: Int
	
	enum CodingKeys: String, CodingKey {
		case count
		case userLikes = "user_likes"
	}
}
