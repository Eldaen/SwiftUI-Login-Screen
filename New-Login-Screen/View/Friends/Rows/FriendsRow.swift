//
//  FriendsRow.swift
//  New-Login-Screen
//
//  Created by Денис Сизов on 24.03.2022.
//

import SwiftUI

/// Вью для отображения данных друга в списке
struct FriendsRow: View {
	
	let friend: Friend
	
    var body: some View {
		Text(friend.name)
    }
}

struct FriendsRow_Previews: PreviewProvider {
	
	static var friend = Friend(name: "Vasia", imageName: "")
	
    static var previews: some View {
        FriendsRow(friend: friend)
    }
}
