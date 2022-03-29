//
//  FriendsRow.swift
//  New-Login-Screen
//
//  Created by Денис Сизов on 24.03.2022.
//

import SwiftUI
import Kingfisher

/// Вью для отображения данных друга в списке
struct FriendsRow: View {
	
	/// Модель друга
	let friend: Friend
	
    var body: some View {
		HStack {
			KFImage(friend.imageUrl)
				.resizable()
				.frame(width: 50, height: 50, alignment: .leading)
				.cornerRadius(25)
				.shadow(radius: 5)
			
			Text(friend.name)
				.padding([.leading])
		}
    }
}

struct FriendsRow_Previews: PreviewProvider {
	
	static var friend = Friend(id: 0, name: "Vasia", image: "")
	
    static var previews: some View {
        FriendsRow(friend: friend)
    }
}
