//
//  TrendingCreatorsView.swift
//  TravelDiscovery
//
//  Created by Rustam Chergizbiev on 12/6/22.
//

import SwiftUI

struct TrendingCreatorsView: View {
	
	let creators: [Creator] = [
		.init(name: "Amy Adams", imageName: "amy"),
		.init(name: "Billy Childs", imageName: "billy"),
		.init(name: "Sam Smith", imageName: "sam")
	]
	
	var body: some View {
		VStack {
			HStack {
				Text("Trending Creators")
					.font(.system(size: 16, weight: .semibold))
				Spacer()
				SeeAllTextView()
			}
			.foregroundColor(.black)
			.padding(.horizontal)
			.padding(.top)
			
			ScrollView(.horizontal, showsIndicators: false) {
				HStack(alignment: .top, spacing: 12) {
					ForEach(creators, id: \.self) { creator in
						VStack(spacing: 4) {
							Image(creator.imageName)
								.resizable()
								.scaledToFill()
								.frame(width: 60, height: 60)
								.clipped()
								.cornerRadius(.infinity)
								.shadow(color: .init(.sRGB, white: 0.7, opacity: 1), radius: 3, x: 0, y: 2)
								.padding(.bottom, 6)
							
							Text(creator.name)
								.font(.system(size: 12, weight: .semibold))
								.foregroundColor(.black)
								.multilineTextAlignment(.center)
						}
						.frame(width: 60)
					}
				}
				.padding(.horizontal)
			}
		}
	}
}



struct TrendingCreatorsView_Previews: PreviewProvider {
    static var previews: some View {
        TrendingCreatorsView()
    }
}
