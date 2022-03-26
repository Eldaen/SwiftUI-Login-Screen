//
//  AppView.swift
//  New-Login-Screen
//
//  Created by Денис Сизов on 22.03.2022.
//

import SwiftUI

struct AppView: View {
	
	@State var isLoggedIn: Bool = false
	@AppStorage("vkToken") var token: String?
	
    var body: some View {
		NavigationView {
			HStack {
				if token == nil {
					VKLoginWebView()
				} else {
					MainScreenView()
				}
			}
		}
    }
}

struct AppView_Previews: PreviewProvider {
    static var previews: some View {
        AppView()
    }
}
