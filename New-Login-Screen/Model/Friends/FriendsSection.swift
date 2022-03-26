//
//  FriendsSection.swift
//  New-Login-Screen
//
//  Created by Денис Сизов on 24.03.2022.
//

import Foundation

/// Структура секции друга
struct FriendsSection: Identifiable, Comparable {
	
	/// id == имени
	var id: Character { key }
	
	var key: Character
	var data: [Friend]
	
	static func < (lhs: FriendsSection, rhs: FriendsSection) -> Bool {
		return lhs.key < rhs.key
	}
	
	static func == (lhs: FriendsSection, rhs: FriendsSection) -> Bool {
		return lhs.key == rhs.key
	}
}
