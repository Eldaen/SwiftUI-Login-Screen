//
//  MainScreenView.swift
//  New-Login-Screen
//
//  Created by Денис Сизов on 22.03.2022.
//

import SwiftUI

/// Вью для отображения основного экрана после авторизации
struct MainScreenView: View {
	
	private let tabTitles = ["Friends", "Groups", "News"]
	@State var selection = 0
	
	/// Сервис для загрузки друзей
	let userService = UserService(networkManager: NetworkManager())
	
    var body: some View {
		
		TabView(selection: $selection) {
			FriendsView(
				viewModel: FriendsViewModel(
					loader: userService
				)
			)
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
    }
}

struct MainScreenView_Previews: PreviewProvider {
    static var previews: some View {
        MainScreenView()
    }
}
