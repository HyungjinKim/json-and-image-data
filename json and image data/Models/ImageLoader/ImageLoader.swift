//
//  ImageLoader.swift
//  json and image data
//
//  Created by Hyung-Jin Kim on 2019/12/03.
//  Copyright © 2019 home. All rights reserved.
//

import Foundation
import SwiftUI
import Combine

class ImageLoader: ObservableObject {
    @Published var objectWillChange = PassthroughSubject<Data, Never>()
    @Published var dataIsValid = false
    @Published var isLoading = false
    @Published var data =  Data() {
        willSet {
            objectWillChange.send(data)
        }
    }
        
    func loadImage(_ url: String) {
        isLoading = true

        let youtubeImageUrl = url.split(separator: "?")
        guard let url = URL(string: String(youtubeImageUrl[0])) else { return }
        URLSession.shared.dataTask(with: url) { (data, _, _) in
            guard let data = data else { return }
            
            DispatchQueue.main.async {
                self.dataIsValid = true
                self.isLoading = false
                self.data = data
            }
        }.resume()
    }
}

