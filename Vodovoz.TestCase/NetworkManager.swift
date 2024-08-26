//
//  NetworkManager.swift
//  Vodovoz.TestCase
//
//  Created by Pavel Gribachev on 26.08.2024.
//

import Foundation

// MARK: - URL сайта
enum VodovozURL {
	static let apiUrl = "https://szorin.vodovoz.ru/newmobile/glavnaya/super_top.php?action=topglav"
	static let mainURL = "https://szorin.vodovoz.ru"
}

// MARK: - Получение данных из сети
final class NetworkManager {
	static let shared = NetworkManager()
	
	private init() {}
		
	// Загрузка любых данных из сети
	func fetch<T: Decodable>(
		_ type: T.Type,
		fromURL url: String,
		completion: @escaping (Result<T, NetworkErrors>) -> Void
	) {
		guard let url = URL(string: url) else {
			return completion(.failure(.invalidURL))
		}
		
		URLSession.shared.dataTask(with: url) { data, _, _ in
						
			guard let data else {
				return completion(.failure(.dataError))
			}
						
			do {
				let decoder = JSONDecoder()
				let dataModel = try decoder.decode(T.self, from: data)
				
				completion(.success(dataModel))
				Logger.logSucces(message: "Данные успешно декодированы")
				
			} catch {
				completion(.failure(.decodeError))
			}
			
		}.resume()
	}
}
