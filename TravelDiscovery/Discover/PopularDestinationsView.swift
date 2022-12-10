//
//  PopularDestinationsView.swift
//  TravelDiscovery
//
//  Created by Rustam Chergizbiev on 12/6/22.
//

import SwiftUI

struct PopularDestinationsView: View {
	
	let destinations: [Destination] = [
		.init(name: "Paris", country: "France", imageName: "eiffel_tower"),
		.init(name: "Tokyo", country: "Japan", imageName: "japan"),
		.init(name: "New York", country: "US", imageName: "new_york")
	]
	
	var body: some View {
		VStack {
			HStack {
				Text("Popular Destinations")
					.font(.system(size: 16, weight: .semibold))
				Spacer()
				SeeAllTextView()
			}
			.foregroundColor(.black)
			.padding(.horizontal)
			.padding(.top)
			
			ScrollView(.horizontal, showsIndicators: false) {
				HStack(spacing: 12) {
					ForEach(destinations, id: \.self) { destination in
						NavigationLink {
							//
						} label: {
							VStack(alignment: .leading, spacing: 0) {
								Image(destination.imageName)
									.resizable()
									.scaledToFill()
									.frame(width: 128, height: 128)
									.clipped()
									.cornerRadius(4)
									.padding(.horizontal, 6)
									.padding(.vertical, 6)
								
								Text(destination.name)
									.font(.system(size: 12, weight: .semibold))
									.foregroundColor(Color(.black))
									.padding(.horizontal, 12)
								
								Text(destination.country)
									.font(.system(size: 12, weight: .semibold))
									.foregroundColor(Color(.systemGray))
									.padding(.horizontal, 12)
									.padding(.bottom, 8)
							}
							.asTile()
							.padding(.bottom)
						}
					}
				}
				.padding(.horizontal)
			}
		}
	}
}


struct PopularDestinationsView_Previews: PreviewProvider {
    static var previews: some View {
		DiscoverView()
        PopularDestinationsView()
    }
}
