//
//  Friend.swift
//  New-Login-Screen
//
//  Created by Денис Сизов on 24.03.2022.
//

import Foundation

/// Модель друга
struct Friend: Identifiable {
	let id: UUID = UUID()
	let name: String
	let imageName: String
	let images: [FriendImage]
}
