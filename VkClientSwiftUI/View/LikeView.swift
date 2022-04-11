//
//  LikeView.swift
//  New-Login-Screen
//
//  Created by Денис Сизов on 06.04.2022.
//

import SwiftUI

/// Вью для отображения лайков
struct LikeView: View {
	
	/// Флаг заполненности сердечка
	@Binding var likeFlag: Bool
	
	/// Кол-во лайков у фото
	var likesCount: Int
	
    var body: some View {
		
		HStack {
			Text(String(likesCount))
			
			if likeFlag {
				Image(systemName: "heart.fill")
			} else {
				Image(systemName: "heart")
			}
		}
    }
}
