//
//  ActivityIndicatorView.swift
//  TravelDiscovery
//
//  Created by Rustam Chergizbiev on 12/10/22.
//

import SwiftUI

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
