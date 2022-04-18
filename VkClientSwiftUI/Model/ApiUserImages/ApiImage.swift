//
//  ApiImage.swift
//  VK client
//
//  Created by Денис Сизов on 19.11.2021.
//

/// Модель картинки пользователя
struct ApiImage: Codable {
	let id: Int
	let ownerId: Int
	let sizes: [Sizes]
	let likes: ImageLikes
	
	enum CodingKeys: String, CodingKey {
		case id
		case sizes
		case likes
		case ownerId = "owner_id"
	}
}
