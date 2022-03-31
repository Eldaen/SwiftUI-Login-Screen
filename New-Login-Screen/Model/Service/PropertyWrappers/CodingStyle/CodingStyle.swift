//
//  CodingStyle.swift
//  New-Login-Screen
//
//  Created by Денис Сизов on 31.03.2022.
//

import Foundation

/// Проперти враппер для приведения строк к выбранному стилю
@propertyWrapper struct CodingStyle {
	
	/// Приведённая строка
	private var text: String
	
	/// Выбранный стиль
	private var currectCase: CodingStyles
	
	init(wrappedValue: String, style: CodingStyles) {
		text = wrappedValue
		currectCase = style
	}
	
	var wrappedValue: String {
		get {
			get()
		}
		
		set {
			set(newValue)
		}
	}
	
	/// Типы стилей, с которыми работает враппер
	enum CodingStyles{
		case camelCase
		case snakeCase
		case kebabCase
	}
}

// MARK: - Private methods
private extension CodingStyle {
	
	func get() -> String {
		switch currectCase {
		case .camelCase:
			return makeCamelCase()
		case .snakeCase:
			makeSnakeCase()
		case .kebabCase:
			makeKebabCase()
		}
		
		return text
	}
	
	mutating func set(_ text: String) {
		self.text = text
	}
	
	func makeCamelCase() -> String {
		let text = text.lowercased()
			.split(separator: " ")
			.reduce("") {
				let firstChar = $1.first ?? Character("")
				return $0 + String(firstChar) + String($1.dropFirst())
			}
		return text
	}
	
	func makeSnakeCase() {
		
	}
	
	func makeKebabCase() {
		
	}
}


