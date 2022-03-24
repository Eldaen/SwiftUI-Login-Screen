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

extension FriendsSection {
	static var data = [
		FriendsSection(name: "V",
					   friends: [
						Friend(name: "Vasia", imageName: "", images: [
							FriendImage(name: "person"),
							FriendImage(name: "person"),
							FriendImage(name: "person"),
							FriendImage(name: "person"),
						]),
						Friend(name: "Vania", imageName: "", images: [])
					   ]),
		FriendsSection(name: "K",
					   friends: [
						Friend(name: "Katia", imageName: "", images: []),
						Friend(name: "Kiril", imageName: "", images: [])
					   ]),
		FriendsSection(name: "P",
					   friends: [
						Friend(name: "Petia", imageName: "", images: [])
					   ]),
		FriendsSection(name: "S",
					   friends: [
						Friend(name: "Sasha", imageName: "", images: [])
					   ]),
		FriendsSection(name: "M",
					   friends: [
						Friend(name: "Masha", imageName: "", images: [])
					   ]),
		FriendsSection(name: "D",
					   friends: [
						Friend(name: "Dasha", imageName: "", images: [])
					   ]),
	]
}
