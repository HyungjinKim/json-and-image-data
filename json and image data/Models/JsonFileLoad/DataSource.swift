//
//  DataSource.swift
//  json and image data
//
//  Created by Hyung-Jin Kim on 2019/12/18.
//  Copyright © 2019 home. All rights reserved.
//

import Foundation
import SwiftUI
import Combine

class DataSource: ObservableObject {
    @Published var didChange = PassthroughSubject<Void, Never>()
    @Published var jsons = [String]()
    
    init() {
        let fm = FileManager.default
        
        if let path = Bundle.main.resourcePath, let items = try? fm.contentsOfDirectory(atPath: path) {
            for item in items {
                if item.hasPrefix("youtube") {
                    jsons.append(item)
                }
            }
        }
        didChange.send()
    }
}
