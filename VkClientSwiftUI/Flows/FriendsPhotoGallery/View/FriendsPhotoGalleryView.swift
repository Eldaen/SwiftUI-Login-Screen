//
//  FriendsPhotoGalleryView.swift
//  VkClientSwiftUI
//
//  Created by Денис Сизов on 11.04.2022.
//

import SwiftUI
import Kingfisher


/// Вью для отображения подробного просмотра фотографии
struct FriendsPhotoGalleryView: View {
	
	/// Вью модель экрана просмотра фото
	@ObservedObject var viewModel: FriendsPhotoGalleryViewModel
	
	init(image: FriendImage, networkManager: NetworkManager) {
		self.viewModel = FriendsPhotoGalleryViewModel(
			currentPhoto: image,
			imageLikeService: ImageLikeService(networkManager: networkManager)
		)
	}
	
	var body: some View {
		VStack {
			Spacer()
			
			KFImage(viewModel.photo.imageUrl)
				.resizable()
				.scaledToFit()
			
			Spacer()
			
			LikeView(likeFlag: $viewModel.likeFlag, likesCount: viewModel.photo.likesCount)
				.padding()
				.foregroundColor(Color.white)
		}
		.frame(maxWidth: .infinity)
		.background(Color.black)
		.onTapGesture {
			viewModel.photo.userLikes == 0 ? viewModel.setLike() : viewModel.removeLike()
		}
	}
}
