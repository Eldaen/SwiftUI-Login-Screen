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
	@State private var friends: [FriendsSection] = FriendsSection.data
	
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
