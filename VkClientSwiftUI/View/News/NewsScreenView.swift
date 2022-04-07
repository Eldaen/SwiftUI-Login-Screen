//
//  NewsScreenView.swift
//  New-Login-Screen
//
//  Created by Денис Сизов on 22.03.2022.
//

import SwiftUI

struct NewsScreenView: View {
    var body: some View {
		NewsUIKitView(isShowing: .constant(true))
    }
}

struct NewsScreenView_Previews: PreviewProvider {
    static var previews: some View {
		NewsScreenView()
    }
}
