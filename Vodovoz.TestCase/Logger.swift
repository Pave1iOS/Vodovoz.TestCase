//
//  Logger.swift
//  Vodovoz.TestCase
//
//  Created by Pavel Gribachev on 27.08.2024.
//

import Foundation

struct Logger {
	static func logError(message: NetworkErrors, file: String = #file, line: Int = #line) {
		NSLog("❌ ERROR: \(message)\n File: \(file)\n Line: \(line)")
	}
	
	static func logSucces(message: String, file: String = #file, line: Int = #line) {
		NSLog("✅ SUCCESS: \(message)\n File: \(file)\n Line: \(line)")
	}
	
	static func logInfo(message: String, file: String = #file, line: Int = #line) {
		NSLog("💻 INFO: \(message)\n File: \(file)\n Line: \(line)")
	}
}
