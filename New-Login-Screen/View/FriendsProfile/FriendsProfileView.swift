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
	
	@ObservedObject var viewModel: FriendsProfileViewModel
	
	init(viewModel: FriendsProfileViewModel) {
		self.viewModel = viewModel
	}
	
    var body: some View {
		VStack {
			Text(viewModel.friend.name)
			
			ASCollectionView(data: viewModel.storedImages) { item, _ in
				FriendsProfileRow(image: item)
			}
			.layout {
				.grid(
					layoutMode: .fixedNumberOfColumns(3),
					itemSpacing: 8,
					lineSpacing: 16,
					itemSize: .absolute(100)
				)
			}
			.onAppear {
				viewModel.fetchPhotos {
}
			}
		}

    }
}
