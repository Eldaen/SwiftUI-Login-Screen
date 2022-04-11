//
//  FriendsPhotoGalleryView.swift
//  VkClientSwiftUI
//
//  Created by Денис Сизов on 11.04.2022.
//

import SwiftUI
import Kingfisher

struct FriendsPhotoGalleryView: View {
	
	@ObservedObject var viewModel: FriendsPhotoGalleryViewModel
	
	init(image: FriendImage) {
		self.viewModel = FriendsPhotoGalleryViewModel(currentPhoto: image)
	}
	
	var body: some View {
		GeometryReader { proxy in
			VStack {
				KFImage(viewModel.photo.imageUrl)
					.resizable()
					.scaledToFill()
				
				LikeView(likeFlag: .constant(false), likesCount: 10)
					.frame(width: proxy.size.width, height:0)
					.background(Color.green)
			}
		}
	}
}

struct FriendsPhotoGalleryView_Previews: PreviewProvider {	
	static var previews: some View {
		FriendsPhotoGalleryView(image: FriendImage(link: ""))
	}
}
