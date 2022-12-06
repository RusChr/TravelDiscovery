//
//  PopularRestaurantsView.swift
//  TravelDiscovery
//
//  Created by Rustam Chergizbiev on 12/6/22.
//

import SwiftUI

struct PopularRestaurantsView: View {
	
	let restaurants: [Restaurant] = [
		.init(name: "Japan's Finest Tapas", imageName: "tapas", place: "Tokyo, Japan", dish: "Sushi", rating: "4.7"),
		.init(name: "Bar & Grill", imageName: "bar_grill", place: "New York, US", dish: "Barbeque", rating: "4.9")
	]
	
	var body: some View {
		VStack {
			HStack {
				Text("Popular Places To Eat")
					.font(.system(size: 16, weight: .semibold))
				Spacer()
				SeeAllTextView()
			}
			.foregroundColor(.black)
			.padding(.horizontal)
			.padding(.top)
			
			ScrollView(.horizontal, showsIndicators: false) {
				HStack(spacing: 12) {
					ForEach(restaurants, id: \.self) { restaurant in
						HStack {
							Image(restaurant.imageName)
								.resizable()
								.scaledToFill()
								.frame(width: 64, height: 64)
								.clipped()
								.cornerRadius(4)
								.padding(6)
							
							VStack(alignment: .leading, spacing: 6) {
								HStack {
									Text(restaurant.name)
									Spacer()
									Button(action: {}, label: {
										Image(systemName: "ellipsis")
											.foregroundColor(.gray)
									})
								}
								
								Text("★ \(restaurant.rating) • \(restaurant.dish) • $$")
									.font(.system(size: 12))
								
								Text(restaurant.place)
							}
							.font(.system(size: 12, weight: .semibold))
							.foregroundColor(.black)
							
							Spacer()
						}
						.frame(width: 240)
						.background(.white)
						.cornerRadius(8)
						.shadow(color: .init(.sRGB, white: 0.8, opacity: 1), radius: 3, x: 0, y: 2)
						.padding(.bottom)
					}
				}
				.padding(.horizontal)
			}
		}
	}
}


struct PopularRestaurantsView_Previews: PreviewProvider {
    static var previews: some View {
        PopularRestaurantsView()
    }
}
