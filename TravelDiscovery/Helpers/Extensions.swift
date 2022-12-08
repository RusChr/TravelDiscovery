//
//  Extensions.swift
//  TravelDiscovery
//
//  Created by Rustam Chergizbiev on 12/6/22.
//


import SwiftUI

extension Color {
	static let discoverGradient1 = Color(#colorLiteral(red: 0.9529411793, green: 0.6862745285, blue: 0.1333333403, alpha: 1))
	static let discoverGradient2 = Color(#colorLiteral(red: 0.9411764741, green: 0.4980392158, blue: 0.3529411852, alpha: 1))
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
