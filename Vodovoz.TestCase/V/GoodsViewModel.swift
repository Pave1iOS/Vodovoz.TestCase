//
//  GoodsViewModel.swift
//  Vodovoz.TestCase
//
//  Created by Pavel Gribachev on 26.08.2024.
//

import Foundation

final class GoodsViewModel {
	private let networkManager = NetworkManager.shared
	
	func getItems() {
		networkManager.fetch(GoodsModel.self, fromURL: VodovozURL.apiUrl) { result in
			switch result {
			case .success(let response):
				
				print(response.message)
			case .failure(let error):
				print(error.description)
			}
		}
	}
}
