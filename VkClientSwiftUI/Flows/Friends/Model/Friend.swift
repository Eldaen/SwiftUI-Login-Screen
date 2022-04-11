//
//  Friend.swift
//  New-Login-Screen
//
//  Created by Денис Сизов on 24.03.2022.
//

import Foundation

/// Модель друга
struct Friend: Identifiable, Codable {
	let id: Int
	let name: String
	let image: String
	
	var imageUrl: URL? {
		URL(string: image)
	}

	enum CodingKeys: String, CodingKey {
		case name = "first_name"
		case image = "photo_100"
		case id
	}
}
