//
//  NetworkErrors.swift
//  Vodovoz.TestCase
//
//  Created by Pavel Gribachev on 27.08.2024.
//

import Foundation

// MARK: - Ошибки сети
enum NetworkErrors: Error {
	case dataError
	case fetchError
	case decodeError
	case invalidURL
	
	var description: String {
		switch self {
		case .dataError:
			"Ошибка получения data"
		case .fetchError:
			"Ошибка загрузки данных"
		case .decodeError:
			"Ошибка модели данных"
		case .invalidURL:
			"Неверный URL"
		}
	}
}
