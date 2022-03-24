//
//  FriendsView.swift
//  New-Login-Screen
//
//  Created by Денис Сизов on 22.03.2022.
//

import SwiftUI

/// Вью для отображения экрана друзей
struct FriendsView: View {
	
	@State private var friends: [FriendsSection] = [
		FriendsSection(name: "V",
					   friends: [
						Friend(name: "Vasia", imageName: ""),
						Friend(name: "Vania", imageName: "")
					   ]),
		FriendsSection(name: "K",
					   friends: [
						Friend(name: "Katia", imageName: ""),
						Friend(name: "Kiril", imageName: "")
					   ]),
		FriendsSection(name: "P",
					   friends: [
						Friend(name: "Petia", imageName: "")
					   ]),
		FriendsSection(name: "S",
					   friends: [
						Friend(name: "Sasha", imageName: "")
					   ]),
		FriendsSection(name: "M",
					   friends: [
						Friend(name: "Masha", imageName: "")
					   ]),
		FriendsSection(name: "D",
					   friends: [
						Friend(name: "Dasha", imageName: "")
					   ]),
	]
	
    var body: some View {
		
		
		
		List {
			ForEach(friends) { friendSection in
				Section(header: Text(friendSection.name)) {
					ForEach(friendSection.friends) { friend in
						FriendsRow(friend: friend)
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
