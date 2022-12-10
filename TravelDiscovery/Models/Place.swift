//
//  Place.swift
//  TravelDiscovery
//
//  Created by Rustam Chergizbiev on 12/10/22.
//

import Foundation

struct Place: Decodable, Hashable {
	let id: Int
	let name, thumbnail: String
}
