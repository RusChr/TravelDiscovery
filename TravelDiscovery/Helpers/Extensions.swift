//
//  Extensions.swift
//  TravelDiscovery
//
//  Created by Rustam Chergizbiev on 12/6/22.
//


import SwiftUI

extension Color {
	static let discoverGradient1 = Color(#colorLiteral(red: 0.9882131219, green: 0.6823856831, blue: 0.2509839535, alpha: 1))
	static let discoverGradient2 = Color(#colorLiteral(red: 0.996080339, green: 0.446325405, blue: 0.2697934847, alpha: 1))
	static let discoverBackground = Color(.init(white: 0.95, alpha: 1))
}

extension View {
	func asTile() -> some View {
		modifier(TileModifier())
	}
	
	func seeAll() -> some View {
		modifier(SeeAllModifier())
	}
}
