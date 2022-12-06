//
//  ContentView.swift
//  TravelDiscovery
//
//  Created by Rustam Chergizbiev on 11/30/22.
//

import SwiftUI

struct DiscoverView: View {
	
	init() {
		UINavigationBar.appearance().largeTitleTextAttributes = [
			.foregroundColor: UIColor.white
		]
	}
	
	var body: some View {
		NavigationView {
			ZStack {
				LinearGradient(gradient: Gradient(colors: [Color.color1, Color.color2]), startPoint: .topLeading, endPoint: .bottomTrailing)
					.ignoresSafeArea()
				
				Color(.init(white: 0.95, alpha: 1))
					.frame(maxHeight: .infinity, alignment: .bottom)
					.offset(y: 400)
				
				ScrollView {
					HStack {
						Image(systemName: "magnifyingglass")
						Text("Where do you want to go?")
						Spacer()
					}
					.font(.system(size: 14, weight: .semibold))
					.foregroundColor(.white)
					.padding()
					.background(Color(.init(white: 1, alpha: 0.3)))
					.cornerRadius(12)
					.padding(.horizontal)
					
					DiscoverCategoryView()
					
					VStack {
						PopularDestinationsView()
						
						PopularRestaurantsView()
						
						TrendingCreatorsView()
					}
					.background(Color(.init(white: 0.95, alpha: 1)))
					.cornerRadius(16)
					.padding(.top, 16)
				}
				.navigationTitle("Discover")
			}
		}
	}
}


struct DiscoverView_Previews: PreviewProvider {
	static var previews: some View {
		DiscoverView()
	}
}





