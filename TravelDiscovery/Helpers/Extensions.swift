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
		FontTests()
	}
}


struct FontTests: View {
	let size: CGFloat = 28
	var body: some View {
		ScrollView(showsIndicators: false) {
			ForEach(UIFont.familyNames, id: \.self) { font in
				HStack {
					VStack(alignment: .leading, spacing: 4) {
						Text(font)
							.font(.system(size: 24))
						
						Text("Вайнах Телеком")
							.font(Font.custom(font, size: size))
						Text("Вайнах Телеком")
							.font(Font.custom(font, size: size))
							.textCase(.uppercase)
						
						Text("Vainakh Telecom")
							.font(Font.custom(font, size: size))
						Text("Vainakh Telecom")
							.font(Font.custom(font, size: size))
							.textCase(.uppercase)
						
						Divider()
							.padding(.bottom)
					}
					.multilineTextAlignment(.leading)
					
					Spacer()
				}
				.padding(.horizontal)
			}
		}
	}
}
