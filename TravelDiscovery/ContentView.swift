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
				
			}
			.navigationTitle("Discover")
		}
	}
}


struct ContentView_Previews: PreviewProvider {
	static var previews: some View {
		ContentView()
	}
}

struct DiscoverCategoryView: View {
	var body: some View {
		ScrollView(.horizontal, showsIndicators: false) {
			HStack(spacing: 8) {
				ForEach(0..<5, id: \.self) { _ in
					VStack(spacing: 8) {
						Spacer()
							.frame(width: 50, height: 50)
							.background(Color.gray)
							.cornerRadius(.infinity)
							.shadow(color: Color(.lightGray), radius: 2, x: 0, y: 2)
						Text("Art")
							.font(.system(size: 14, weight: .semibold))
					}
				}
			}.padding(.horizontal)
		}
	}
}
