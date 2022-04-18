//
//  ImageLikeService.swift
//  VkClientSwiftUI
//
//  Created by Денис Сизов on 18.04.2022.
//

import Foundation

/// Сервис для управления лайками фотографий
final class ImageLikeService {
	
	var networkManager: NetworkManagerInterface
	
	// MARK: - Init
	
	init(networkManager: NetworkManagerInterface) {
		self.networkManager = networkManager
	}
	
	/// Установить лайк фотографии
	func setLike(by owner_id: Int, for id: Int, completion: @escaping (Int) -> Void) {
		
		let params = [
			"type" : "photo",
			"item_id" : "\(id)",
			"owner_id" : "\(owner_id)",
		]
		
		networkManager.request(method: .setLike,
							   httpMethod: .post,
							   params: params) { (result: Result<LikesResponse, Error>) in
			switch result {
			case .success(let response):
				completion(response.response.likes)
			case .failure(let error):
				debugPrint("Error: \(error.localizedDescription)")
			}
		}
	}
	
	/// Убрать лайк с фотографии
	func removeLike(by owner_id: Int, for id: Int, completion: @escaping (Int) -> Void) {
		let params = [
			"type" : "photo",
			"item_id" : "\(id)",
			"owner_id" : "\(owner_id)",
		]
		
		networkManager.request(method: .removeLike,
							   httpMethod: .post,
							   params: params) { (result: Result<LikesResponse, Error>) in
			switch result {
			case .success(let response):
				completion(response.response.likes)
			case .failure(let error):
				debugPrint("Error: \(error.localizedDescription)")
			}
		}
	}
}
