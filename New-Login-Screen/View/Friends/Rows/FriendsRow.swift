//
//  FriendsRow.swift
//  New-Login-Screen
//
//  Created by Денис Сизов on 24.03.2022.
//

import SwiftUI

/// Вью для отображения данных друга в списке
struct FriendsRow: View {
	
	/// Модель друга
	let friend: Friend
	
    var body: some View {
		HStack {
			Image(systemName: "person")
				.resizable()
				.frame(width: 30, height: 30)
			Text(friend.name)
		}
    }
}

struct FriendsRow_Previews: PreviewProvider {
	
	static var friend = Friend(name: "Vasia", imageName: "", images: [])
	
    static var previews: some View {
        FriendsRow(friend: friend)
    }
}
