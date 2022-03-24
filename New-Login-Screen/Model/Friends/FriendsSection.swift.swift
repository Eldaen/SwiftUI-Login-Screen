//
//  FriendsSection.swift.swift
//  New-Login-Screen
//
//  Created by Денис Сизов on 24.03.2022.
//

import Foundation

/// Структура секции друга
struct FriendsSection: Identifiable {
	
	/// id == имени
	var id: String { name }
	
	let name: String
	let friends: [Friend]
}
