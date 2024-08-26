//
//  GoodsModel.swift
//  Vodovoz.TestCase
//
//  Created by Pavel Gribachev on 26.08.2024.
//

import Foundation

// MARK: - Main model
struct GoodsModel: Decodable {
	let status: String
	let message: String
	
	let goods: [Goods]
	
	enum CodingKeys: String, CodingKey {
		case status
		case message
		case goods = "TOVARY"
	}
}

// MARK: - Chapter goods model
struct Goods: Decodable {
	let id: Int
	let chapterName: String
	let items: [Items]
	
	enum CodingKeys: String, CodingKey {
		case id = "ID"
		case chapterName = "NAME"
		case items = "data"
	}
}

// MARK: - Items model
struct Items: Decodable {
	let detailPicture: String
	let extendedPrice: [Price]
	let favorite: Bool
	
	enum CodingKeys: String, CodingKey {
		case detailPicture = "DETAIL_PICTURE"
		case extendedPrice = "EXTENDED_PRICE"
		case favorite = "FAVORITE"
	}
}

struct Price: Decodable {
	let price: Int
	
	enum CodingKeys: String, CodingKey {
		case price = "PRICE"
	}
}
