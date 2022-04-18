//
//  FriendsProfileView.swift
//  New-Login-Screen
//
//  Created by Денис Сизов on 24.03.2022.
//

import SwiftUI
import ASCollectionView
import Kingfisher

/// Вью для отображения профиля друга
struct FriendsProfileView: View {
	
	/// Вью модель профиля пользователя
	@ObservedObject var viewModel: FriendsProfileViewModel
	
	/// Состояние высоты ячейки
	@State private var rowHeight: CGFloat = 0
	
	let columns = [
		GridItem(.flexible(minimum: 0)),
		GridItem(.flexible(minimum: 0)),
		GridItem(.flexible(minimum: 0)),
	]
	
	/// Флаг для отображения анимации лайка фото профиля
	@State var likesFlag: Bool = false
	
	/// Статическое кол-во лайков под фото пользователя, пока не сделана загрузка
	@State var profilePhotoLikes: Int = 0
	
	private let screenWidth = UIApplication.shared.connectedScenes
		.filter({$0.activationState == .foregroundActive})
		.compactMap({$0 as? UIWindowScene})
		.first?
		.windows
		.filter({$0.isKeyWindow})
		.first?.frame.width ?? 0
	
	// MARK: - Init
	
	init(viewModel: FriendsProfileViewModel) {
		self.viewModel = viewModel
	}
	
	// MARK: - Body
	
	var body: some View {
		VStack {
			VStack {
				KFImage(viewModel.friend.imageUrl)
				LikeView(likeFlag: $likesFlag, likesCount: profilePhotoLikes)
					.foregroundColor(Color.red)
			}
			.onTapGesture {
				likesFlag.toggle()
				
				profilePhotoLikes = likesFlag == true ? profilePhotoLikes + 1 : profilePhotoLikes - 1
			}
			.padding(.bottom, 16)
			
			GeometryReader { proxy in
				ScrollView {
					LazyVGrid(columns: columns, alignment: .center, spacing: 16) {
						if let images = viewModel.storedImages {
							ForEach(images) { image in
								FriendsProfileImagesCell(image: image, networkManager: viewModel.loader.networkManager)
									.frame(height: self.rowHeight)
							}
						}
					}
					.onAppear {
						viewModel.fetchPhotos { }
					}
					.onPreferenceChange(FriendsProfileImagesCellPreference.self) { height in
						self.rowHeight = height
					}
				}
			}
		}
	}
}
