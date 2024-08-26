//
//  GoodsViewModel.swift
//  Vodovoz.TestCase
//
//  Created by Pavel Gribachev on 26.08.2024.
//

import Foundation

final class GoodsViewModel {
	private let networkManager = NetworkManager.shared
	var reloadData: (() -> Void)?
	
	var goodsCount = 0
	var imageUrls: [String] = []
	
	func loadData() {
		networkManager.fetch(GoodsModel.self, fromURL: VodovozURL.apiUrl) { [unowned self] result in
			switch result {
			case .success(let response):
				Logger.logInfo(message: "Загрузка началась")
				
				goodsCount = response.goods.count
				response.goods.map { $0.items.map { $0.detailPicture } }
				
				
				reloadData?()
				
				Logger.logSucces(message: "Загрузка выполнена, данные переданы")
				
			case .failure:
				Logger.logError(message: .fetchError)
			}
		}
	}
	
	
}

private extension GoodsViewModel {
	
}
