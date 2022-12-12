//
//  CategoryDetailsView.swift
//  TravelDiscovery
//
//  Created by Rustam Chergizbiev on 12/10/22.
//

import SwiftUI
import SDWebImageSwiftUI

class CategoryDetailsViewModel: ObservableObject {
	
	@Published var isLoading = true
	@Published var places = [Place]()
	@Published var errorMessage = ""
	
	init(name: String) {
		let urlString = "https://travel.letsbuildthatapp.com/travel_discovery/category?name=\(name.lowercased())".addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed) ?? ""
		
		guard let url = URL(string: urlString) else {
			isLoading.toggle()
			return
		}
		
		URLSession.shared.dataTask(with: url) { data, resp, err in
			DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
				if let statusCode = (resp as? HTTPURLResponse)?.statusCode, statusCode >= 400 {
					self.isLoading.toggle()
					self.errorMessage = "Bad status: \(statusCode)"
					return
				}
				
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


struct CategoryDetailsView: View {
	
	private let name: String
	@ObservedObject private var vm: CategoryDetailsViewModel
	
	init(name: String) {
		self.name = name
		self.vm = .init(name: name)
	}
	
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
					if !vm.errorMessage.isEmpty {
						VStack(spacing: 16) {
							Image(systemName: "xmark.circle.fill")
								.font(.system(size: 64, weight: .semibold))
								.foregroundColor(Color(.systemRed))
							Text(vm.errorMessage)
								.fontWeight(.semibold)
						}
					}
					
					ScrollView {
						ForEach(vm.places, id: \.self) { place in
							VStack(alignment: .leading, spacing: 0) {
								WebImage(url: URL(string: place.thumbnail))
									.resizable()
									.indicator(.activity)
									.transition(.fade(duration: 0.5))
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
					.navigationTitle(name)
					.navigationBarTitleDisplayMode(.inline)
					.scrollIndicators(.hidden)
				}
			}
		}
	}
}

struct CategoryDetailsView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
			CategoryDetailsView(name: "Food")
        }
		DiscoverView()
    }
}
