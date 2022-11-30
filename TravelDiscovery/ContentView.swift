//
//  ContentView.swift
//  TravelDiscovery
//
//  Created by Rustam Chergizbiev on 11/30/22.
//

import SwiftUI

struct ContentView: View {
	var body: some View {
		NavigationView {
			ScrollView {
				
				DiscoverCategoryView()
				
				PopularDestinationsView()
				
				PopularRestaurantsView()
				
				TrendingCreatorsView()
				
			}
			.navigationTitle("Discover")
		}
	}
}


struct Category: Hashable {
	let name, imageName: String
}


struct DiscoverCategoryView: View {
	
	let categories: [Category] = [
		.init(name: "Art", imageName: "paintpalette.fill"),
		.init(name: "Sport", imageName: "sportscourt.fill"),
		.init(name: "Live Events", imageName: "music.mic"),
		.init(name: "Food", imageName: "fork.knife"),
		.init(name: "History", imageName: "books.vertical.fill")
	]
	
	var body: some View {
		ScrollView(.horizontal, showsIndicators: false) {
			HStack(alignment: .top, spacing: 4) {
				ForEach(categories, id: \.self) { category in
					VStack(spacing: 8) {
						Image(systemName: category.imageName)
							.font(.system(size: 24))
							.foregroundColor(.white)
							.frame(width: 64, height: 64)
							.background(.gray)
							.cornerRadius(.infinity)
							.shadow(color: Color(.gray), radius: 3, x: 0, y: 2)
						
						Text(category.name)
							.font(.system(size: 14, weight: .semibold))
							.multilineTextAlignment(.center)
					}
					.frame(width: 80)
				}
			}
			.padding()
		}
	}
}


struct PopularDestinationsView: View {
	var body: some View {
		VStack {
			HStack {
				Text("Popular Destinations")
					.font(.system(size: 16, weight: .semibold))
				Spacer()
				Text("See all")
					.font(.system(size: 12, weight: .semibold))
					.foregroundColor(Color(.link))
			}
			.padding(.horizontal)
			.padding(.top)
			
			ScrollView(.horizontal, showsIndicators: false) {
				HStack(spacing: 8) {
					ForEach(0..<5, id: \.self) { _ in
						Spacer()
							.frame(width: 120, height: 150)
							.background(Color.gray)
							.cornerRadius(8)
							.shadow(color: Color(.gray), radius: 3, x: 0, y: 2)
							.padding(.bottom)
					}
				}
				.padding(.horizontal)
			}
		}
	}
}


struct PopularRestaurantsView: View {
	var body: some View {
		VStack {
			HStack {
				Text("Popular places to eat")
					.font(.system(size: 16, weight: .semibold))
				Spacer()
				Text("See all")
					.font(.system(size: 12, weight: .semibold))
					.foregroundColor(Color(.link))
			}
			.padding(.horizontal)
			.padding(.top)
			
			ScrollView(.horizontal, showsIndicators: false) {
				HStack(spacing: 8) {
					ForEach(0..<5, id: \.self) { _ in
						Spacer()
							.frame(width: 200, height: 64)
							.background(Color.gray)
							.cornerRadius(8)
							.shadow(color: Color(.gray), radius: 3, x: 0, y: 2)
							.padding(.bottom)
					}
				}
				.padding(.horizontal)
			}
		}
	}
}


struct TrendingCreatorsView: View {
	var body: some View {
		VStack {
			HStack {
				Text("Popular places to eat")
					.font(.system(size: 16, weight: .semibold))
				Spacer()
				Text("See all")
					.font(.system(size: 12, weight: .semibold))
					.foregroundColor(Color(.link))
			}
			.padding(.horizontal)
			.padding(.top)
			
			ScrollView(.horizontal, showsIndicators: false) {
				HStack(spacing: 8) {
					ForEach(0..<10, id: \.self) { _ in
						VStack(spacing: 8) {
							Spacer()
								.frame(width: 50, height: 50)
								.background(Color.gray)
								.cornerRadius(.infinity)
								.shadow(color: Color(.gray), radius: 3, x: 0, y: 2)
								.padding(.bottom)
						}
					}
				}
				.padding(.horizontal)
			}
		}
	}
}


struct ContentView_Previews: PreviewProvider {
	static var previews: some View {
		ContentView()
	}
}
