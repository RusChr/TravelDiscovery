//
//  DiscoverCategoryView.swift
//  TravelDiscovery
//
//  Created by Rustam Chergizbiev on 12/6/22.
//

import SwiftUI

struct DiscoverCategoryView: View {

	let categories: [Category] = [
		.init(name: "Art", imageName: "paintpalette.fill"),
		.init(name: "Sports", imageName: "sportscourt.fill"),
		.init(name: "Live Events", imageName: "music.mic"),
		.init(name: "Food", imageName: "fork.knife"),
		.init(name: "History", imageName: "books.vertical.fill")
	]

	var body: some View {
		ScrollView(.horizontal, showsIndicators: false) {
			HStack(alignment: .top, spacing: 4) {
				ForEach(categories, id: \.self) { category in
					NavigationLink {
						NavigationLaziView(CategoryDetailsView(name: category.name))
					} label: {
						VStack(spacing: 8) {
							Image(systemName: category.imageName)
								.font(.system(size: 24))
								.foregroundColor(Color.discoverGradient1)
								.frame(width: 64, height: 64)
								.background(Color.discoverBackground)
								.cornerRadius(.infinity)
								.shadow(color: Color(.systemGray), radius: 2, x: 0, y: 1)
							
							Text(category.name)
								.font(.system(size: 14, weight: .semibold))
								.foregroundColor(.white)
								.multilineTextAlignment(.center)
						}
						.frame(width: 80)
					}
				}
			}
			.padding()
		}
	}
}


struct NavigationLaziView<T: View>: View {
	let build: () -> T
	
	init(_ build: @autoclosure @escaping () -> T) {
		self.build = build
	}
	
	var body: T {
		build()
	}
}


struct DiscoverCategoryView_Previews: PreviewProvider {
    static var previews: some View {
		DiscoverCategoryView()
    }
}
