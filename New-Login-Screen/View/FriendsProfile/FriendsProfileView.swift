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
	
	private let screenWidth = UIApplication.shared.connectedScenes
			.filter({$0.activationState == .foregroundActive})
			.compactMap({$0 as? UIWindowScene})
			.first?
			.windows
			.filter({$0.isKeyWindow})
			.first?.frame.width ?? 0
	
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
					lineSpacing: 16
				)
			}
			.onAppear {
				viewModel.fetchPhotos {
}
			}
		}

    }
}
