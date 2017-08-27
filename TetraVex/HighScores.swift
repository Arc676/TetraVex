//
//  HighScores.swift
//  TetraVex
//
//  Created by Alessandro Vinciguerra on 08/08/2017.
//
//  Copyright © 2017 Arc676/Alessandro Vinciguerra
//
//  This program is free software: you can redistribute it and/or modify
//  it under the terms of the GNU General Public License as published by
//  the Free Software Foundation (version 3)
//
//  This program is distributed in the hope that it will be useful,
//  but WITHOUT ANY WARRANTY; without even the implied warranty of
//  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
//  GNU General Public License for more details.
//
//  You should have received a copy of the GNU General Public License
//  along with this program.  If not, see <http://www.gnu.org/licenses/>.

import Foundation

class HighScores: NSObject, NSCoding {

	static let emptyScores: [String: [NSDate : Int]] = [
		"2x2":[:],
		"3x3":[:],
		"4x4":[:],
		"5x5":[:],
		"6x6":[:]
	]
	var scores: [String: [NSDate : Int]]?

	init(_ scores: [String: [NSDate : Int]]) {
		self.scores = scores
	}

	//MARK: - En/Decoding
	func encode(with aCoder: NSCoder) {
		aCoder.encode(scores)
	}

	required convenience init?(coder aDecoder: NSCoder) {
		guard let scores = aDecoder.decodeObject() as? [String: [NSDate : Int]] else {
			return nil
		}
		self.init(scores)
	}

	//MARK: - Saving/Reading
	func save() {
		let data = NSKeyedArchiver.archivedData(withRootObject: self)
		UserDefaults.standard.set(data, forKey: "HighScore")
	}

	static func read() -> HighScores {
		guard let data = UserDefaults.standard.object(forKey: "HighScore") as? Data else {
			return HighScores(HighScores.emptyScores)
		}
		return NSKeyedUnarchiver.unarchiveObject(with: data) as! HighScores
	}

}
