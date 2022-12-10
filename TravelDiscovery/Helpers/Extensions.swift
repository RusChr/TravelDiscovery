//
//  Extensions.swift
//  TravelDiscovery
//
//  Created by Rustam Chergizbiev on 12/6/22.
//


import SwiftUI

extension Color {
	static let discoverGradient1 = Color(#colorLiteral(red: 0.8635975718, green: 0.4354846478, blue: 0.3035563529, alpha: 1))
	static let discoverGradient2 = Color(#colorLiteral(red: 0.8253827336, green: 0.3367763898, blue: 0.2823137167, alpha: 1))
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


struct Preview_Extensions: PreviewProvider {
	static var previews: some View {
		DiscoverView()
	}
}
