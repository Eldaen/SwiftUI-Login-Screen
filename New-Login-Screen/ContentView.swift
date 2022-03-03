//
//  ContentView.swift
//  New-Login-Screen
//
//  Created by Денис Сизов on 28.02.2022.
//

import SwiftUI

struct ContentView: View {
	
	@State private var login: String = ""
	@State private var password: String = ""
	@State private var authStatus: Bool = false
	@State private var showingAlert: Bool = false
	
    var body: some View {

		ZStack {
			Color.cyan
				.ignoresSafeArea()
			
			VStack {
				ScrollView {
					
					Image(systemName: "star")
						.resizable()
						.padding(.top, 20)
						.foregroundColor(.orange)
						.frame(minWidth: 100, maxWidth: 150, minHeight: 100, maxHeight: 150)
						.aspectRatio(1, contentMode: .fill)
					
					if authStatus {
						Text("Welcome, admin")
							.font(.largeTitle)
							.padding(.top, 40)
							.opacity(authStatus ? 1 : 0)
						
						Button(action: { logOut() }) {
							Text("Log out")
						}
						.frame(minWidth: 150)
						.font(.title)
						.padding()
						.background(Color.orange)
						.clipShape(Capsule())
						.foregroundColor(.white)
						.padding(.top, 40)
						
					} else {
						Text("Login Screen")
							.font(.largeTitle)
							.padding(.top, 40)
							.opacity(authStatus ? 0 : 1)
						
						VStack {
							VStack {
								HStack {
									Text("Login:")
									Spacer()
									TextField("", text: $login)
										.frame(maxWidth: 150)
										.textFieldStyle(.roundedBorder)
								}
								HStack {
									Text("Password:")
									Spacer()
									SecureField("", text: $password)
										.frame(maxWidth: 150)
										.textFieldStyle(.roundedBorder)
								}
							}
						}
						.padding(.top, 40)
						.frame(maxWidth: 250)
						
						Button(action: { verifyLoginData() }) {
							Text("Log in")
						}
						.frame(minWidth: 150)
						.padding()
						.font(.title)
						.background(Color.orange)
						.clipShape(Capsule())
						.foregroundColor(.white)
						.padding(.top, 40)
						.disabled(login.isEmpty || password.isEmpty)
						.alert(isPresented: $showingAlert) {
							Alert(title: Text("Неверные данные"),
								  message: Text("Ай-яй-яй"),
								  dismissButton: .default(Text("Хнык"))
							)
						}
					}
				}
			}
		}.onTapGesture {
			UIApplication.shared.endEditing()
		}
    }
	
	/// Простейшкая проверка на авторизацию
	private func verifyLoginData() {
		if password == "12345" && login == "Admin" {
			authStatus = true
		} else {
			authStatus = false
			showingAlert = true
		}
	}
	
	/// Разлогинивает пользователя
	private func logOut() {
		authStatus = false
	}
}

extension UIApplication {
   func endEditing() {
	   sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
   }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
		Group {
			ContentView()
		}
    }
}
