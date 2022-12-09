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
		.init(name: "Sport", imageName: "sportscourt.fill"),
		.init(name: "Live Events", imageName: "music.mic"),
		.init(name: "Food", imageName: "fork.knife"),
		.init(name: "History", imageName: "books.vertical.fill")
	]

	var body: some View {
		ScrollView(.horizontal, showsIndicators: false) {
			HStack(alignment: .top, spacing: 4) {
				ForEach(categories, id: \.self) { category in
					NavigationLink {
						CategoryDetailsView()
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


struct Place: Decodable, Hashable {
	let id: Int
	let name, thumbnail: String
}


class CategoryDetailsViewModel: ObservableObject {
	@Published var isLoading = true
	@Published var places = [Place]()
	@Published var errorMessage = ""
	
	init() {
		guard let url = URL(string: "https://travel.letsbuildthatapp.com/travel_discovery/category?name=art") else { return }
		
		URLSession.shared.dataTask(with: url) { data, resp, err in
			DispatchQueue.main.async {
				guard let data = data else { return }
				
				do {
					self.places = try JSONDecoder().decode([Place].self, from: data)
				} catch {
					print("Failed to decode json:", error)
					self.errorMessage = error.localizedDescription
				}
				
				self.isLoading.toggle()
			}
		}.resume()
	}
}


struct ActivityIndicatorView: UIViewRepresentable {
	func makeUIView(context: Context) -> UIActivityIndicatorView {
		let aiv = UIActivityIndicatorView(style: .large)
		aiv.startAnimating()
		aiv.color = .white
		return aiv
	}
	
	func updateUIView(_ uiView: UIActivityIndicatorView, context: Context) {
		
	}
	
	typealias UIViewType = UIActivityIndicatorView
}


struct CategoryDetailsView: View {
	@ObservedObject var vm = CategoryDetailsViewModel()
	
	var body: some View {
		ZStack {
			if vm.isLoading {
				VStack {
					ActivityIndicatorView()
					Text("Loading...")
						.foregroundColor(.white)
						.font(.system(size: 16, weight: .semibold))
				}
				.padding()
				.background(Color(.darkGray))
				.cornerRadius(10)
				
			} else {
				ZStack {
					Text(vm.errorMessage)
					ScrollView {
						ForEach(vm.places, id: \.self) { place in
							VStack(alignment: .leading, spacing: 0) {
								Image("art1")
									.resizable()
									.scaledToFill()
								
								Text(place.name)
									.font(.system(size: 14, weight: .semibold))
									.foregroundColor(.black)
									.padding()
							}
							.asTile()
							.padding()
						}
					}
					.navigationTitle("Category")
					.navigationBarTitleDisplayMode(.inline)
					.scrollIndicators(.hidden)
				}
			}
		}
	}
}


struct DiscoverCategoryView_Previews: PreviewProvider {
    static var previews: some View {
		NavigationView {
			CategoryDetailsView()
		}
		DiscoverView()
//        DiscoverCategoryView()
    }
}
