//
//  MainScreenView.swift
//  New-Login-Screen
//
//  Created by Денис Сизов on 22.03.2022.
//

import SwiftUI

/// Вью для отображения основного экрана после авторизации
struct MainScreenView: View {
	
	// для скрытия вьюхи при логауте
	@Environment(\.presentationMode) var presentation
	
	private let tabTitles = ["Friends", "Groups", "News"]
	@State var selection = 0
	
	
	let userService = UserService(networkManager: NetworkManager())
	
	var body: some View {
		
		TabView(selection: $selection) {
			NavigationView {
				FriendsView(
					viewModel: FriendsViewModel(
						loader: userService
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
			
			NewsView()
				.tabItem {
					Image(systemName: "newspaper")
					Text("News")
				}
				.tag(2)
		}
		.navigationTitle("\(tabTitles[selection])")
		.navigationBarTitleDisplayMode(.inline)
		.toolbar {
			ToolbarItemGroup(placement: .navigation) {
				Button("Logout") {
					Session.instance.clean()
					self.presentation.wrappedValue.dismiss()
				}
			}
		}
	}
}

struct MainScreenView_Previews: PreviewProvider {
	static var previews: some View {
		MainScreenView()
	}
}
