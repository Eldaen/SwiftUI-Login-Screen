//
//  AppView.swift
//  New-Login-Screen
//
//  Created by Денис Сизов on 22.03.2022.
//

import SwiftUI

struct AppView: View {
	
	@State var isLoggedIn: Bool = false
	
    var body: some View {
		NavigationView {
			HStack {
				LoginView(isLoggedIn: $isLoggedIn)
				
				NavigationLink(isActive: $isLoggedIn) {
					MainScreenView()
				} label: {
					EmptyView()
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
