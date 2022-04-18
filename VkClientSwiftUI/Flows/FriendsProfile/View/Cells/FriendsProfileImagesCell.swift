//
//  FriendsProfileImagesCell.swift
//  New-Login-Screen
//
//  Created by Денис Сизов on 24.03.2022.
//

import SwiftUI
import Kingfisher

/// Ячейка для отображения фотографии пользователя в галарее
struct FriendsProfileImagesCell: View {
	
	let image: FriendImage
	
	/// менеджер по работе с сетью, чтобы передать его дальше
	let networkManager: NetworkManagerInterface
	
	var body: some View {
		
		NavigationLink {
			FriendsPhotoGalleryView(
				image: self.image,
				networkManager: networkManager as? NetworkManager ?? NetworkManager()
			)
		} label: {
			GeometryReader { proxy in
				KFImage(image.imageUrl)
					.cancelOnDisappear(true)
					.resizable()
					.preference(key: FriendsProfileImagesCellPreference.self, value: proxy.size.width)
			}
		}
	}
}

/// PreferenceKey структура для передачи желаемой высоты ячейки
struct FriendsProfileImagesCellPreference: PreferenceKey {
	typealias Value = CGFloat
	
	static var defaultValue: CGFloat = 0
	
	static func reduce(value: inout CGFloat, nextValue: () -> CGFloat) {
		value = max(value, nextValue())
	}
}
