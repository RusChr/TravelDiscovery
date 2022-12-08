//
//  Modifiers.swift
//  TravelDiscovery
//
//  Created by Rustam Chergizbiev on 12/6/22.
//

import SwiftUI

struct TileModifier: ViewModifier {
	func body(content: Content) -> some View {
		content
			.background(.white)
			.cornerRadius(8)
			.shadow(color: .init(.sRGB, white: 0.8, opacity: 1), radius: 3, x: 0, y: 2)
	}
}

struct SeeAllModifier: ViewModifier {
	func body(content: Content) -> some View {
		content
			.font(.system(size: 12, weight: .semibold))
			.foregroundColor(Color.discoverGradient2)
	}
}

struct Preview_Modifiers: PreviewProvider {
	static var previews: some View {
		DiscoverView()
	}
}
