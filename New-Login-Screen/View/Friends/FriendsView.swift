//
//  FriendsView.swift
//  New-Login-Screen
//
//  Created by Денис Сизов on 22.03.2022.
//

import SwiftUI

/// Вью для отображения экрана друзей
struct FriendsView: View {
	
	@ObservedObject var viewModel: FriendsViewModel
	
	init(viewModel: FriendsViewModel) {
		self.viewModel = viewModel
		
	}
	
    var body: some View {
		List {
			ForEach(viewModel.friends) { friendSection in
				Section(header: Text(String(friendSection.key))) {
					ForEach(friendSection.data) { friend in
						NavigationLink {
							FriendsProfileView(
								viewModel: FriendsProfileViewModel(friend: friend, loader: viewModel.loader)
							)
						} label: {
							FriendsRow(friend: friend)
						}
					}
				}
				.headerProminence(.increased)
				
			}
		}
		.onAppear(perform: {
			viewModel.fetchFriends {}
		})
		.listStyle(.insetGrouped)
    }
}
