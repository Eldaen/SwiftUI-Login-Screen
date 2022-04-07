//
//  UIApplication+Extensions.swift
//  New-Login-Screen
//
//  Created by Денис Сизов on 03.03.2022.
//

import SwiftUI

extension UIApplication {
   func endEditing() {
	   sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
   }
}
