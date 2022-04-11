//
//  MainScreenView.swift
//  New-Login-Screen
//
//  Created by Денис Сизов on 22.03.2022.
//

import SwiftUI

/// Вью для отображения основного экрана после авторизации
struct MainScreenView: View {
	
	/// Вью модель основного экрана
	var viewModel: MainScreenViewModel
	
	// для скрытия вьюхи при логауте
	@Environment(\.presentationMode) var presentation
	
	private let tabTitles = ["Friends", "Groups", "News"]
	@State var selection = 0
	
	// MARK: - Init
	
	init(viewModel: MainScreenViewModel) {
		UITabBar.appearance().backgroundColor = UIColor.white
		self.viewModel = viewModel
	}
	
	// MARK: - Body
	
	var body: some View {
		
		TabView(selection: $selection) {
			NavigationView {
				FriendsView(
					viewModel: FriendsViewModel(
						loader: viewModel.userService
					)
				)
					.navigationBarTitleDisplayMode(.inline)
			}
			.tabItem {
				Image(systemName: "person")
				Text("Friends")
			}
			.tag(0)
			
			GroupsView()
				.tabItem {
					Image(systemName: "person.3")
					Text("Groups")
				}
				.tag(1)
			
			NewsScreenView()
				.tabItem {
					Image(systemName: "newspaper")
					Text("News")
				}
				.tag(2)
		}
		.navigationTitle("\(tabTitles[selection])")
		.navigationBarTitleDisplayMode(.inline)
		.navigationBarBackButtonHidden(true)
	}
}
