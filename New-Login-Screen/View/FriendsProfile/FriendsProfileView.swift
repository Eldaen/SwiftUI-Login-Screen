//
//  FriendsProfileView.swift
//  New-Login-Screen
//
//  Created by Денис Сизов on 24.03.2022.
//

import SwiftUI
import ASCollectionView

/// Вью для отображения профиля друга
struct FriendsProfileView: View {
	
	/// Модель друга
	let friend: Friend
	
    var body: some View {
		VStack {
			Text(friend.name)
			
//			ASCollectionView(data: friend.images) { item, _ in
//				FriendsProfileRow(image: item)
//			}
//			.layout {
//				.grid(
//					layoutMode: .fixedNumberOfColumns(2),
//					itemSpacing: 8,
//					lineSpacing: 16
//				)
//			}
		}

    }
}

struct FriendsProfileView_Previews: PreviewProvider {
	
	static var friend = Friend(id: 0, name: "Vasia", image: "")
	
    static var previews: some View {
        FriendsProfileView(friend: friend)
    }
}
