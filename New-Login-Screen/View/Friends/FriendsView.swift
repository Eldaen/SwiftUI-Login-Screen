//
//  FriendsView.swift
//  New-Login-Screen
//
//  Created by Денис Сизов on 22.03.2022.
//

import SwiftUI

/// Вью для отображения экрана друзей
struct FriendsView: View {
	
	/// Статические друзья
	@State private var friends: [FriendsSection] = [
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
	
    var body: some View {
		
		
		
		List {
			ForEach(friends) { friendSection in
				Section(header: Text(friendSection.name)) {
					ForEach(friendSection.friends) { friend in
						NavigationLink {
							FriendsProfileView(friend: friend)
						} label: {
							FriendsRow(friend: friend)
						}
					}
				}
				.headerProminence(.increased)
				
			}
		}
		.listStyle(.insetGrouped)
    }
}

struct FriendsView_Previews: PreviewProvider {
    static var previews: some View {
        FriendsView()
    }
}
