//
//  FriendsProfileRow.swift
//  New-Login-Screen
//
//  Created by Денис Сизов on 24.03.2022.
//

import SwiftUI

/// Ячейка для отображения фотографии пользователя в галарее
struct FriendsProfileRow: View {
	
	let image: FriendImage
	
    var body: some View {
		Image(systemName: image.name)
			.resizable()
			.frame(width: 100, height: 100, alignment: .center)
    }
}

struct FriendsProfileRow_Previews: PreviewProvider {
	
	static var image: FriendImage = FriendImage(name: "")
	
    static var previews: some View {
        FriendsProfileRow(image: image)
    }
}
