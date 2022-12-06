//
//  ContentView.swift
//  TravelDiscovery
//
//  Created by Rustam Chergizbiev on 11/30/22.
//

import SwiftUI

struct ContentView: View {
	
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
							.foregroundColor(Color.color1)
							.frame(width: 64, height: 64)
							.background(Color(.init(white: 0.95, alpha: 1)))
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
			.padding()
		}
	}
}


struct Destination: Hashable {
	let name, country, imageName: String
}


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


struct Restaurant: Hashable {
	let name, imageName, place, dish, rating: String
}


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


struct Creator: Hashable {
	let name, imageName: String
}


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


struct ContentView_Previews: PreviewProvider {
	static var previews: some View {
		ContentView()
	}
}


extension Color {
	static let color1 = Color(#colorLiteral(red: 0.9882131219, green: 0.6823856831, blue: 0.2509839535, alpha: 1))
	static let color2 = Color(#colorLiteral(red: 0.996080339, green: 0.446325405, blue: 0.2697934847, alpha: 1))
}


struct SeeAllTextView: View {
	var body: some View {
		Text("See all")
			.font(.system(size: 12, weight: .semibold))
			.foregroundColor(Color.color2)
	}
}
