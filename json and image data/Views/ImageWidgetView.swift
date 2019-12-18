//
//  ImageWidgetView.swift
//  json and image data
//
//  Created by Hyung-Jin Kim on 2019/12/03.
//  Copyright © 2019 home. All rights reserved.
//

import Foundation
import SwiftUI

struct ImageViewWidget: View {
    @ObservedObject var imageLoader: ImageLoader
    
    init(imageUrl: String) {
        imageLoader = ImageLoader()
        imageLoader.loadImage(imageUrl)
    }
    
    var body: some View {
        Image(uiImage: imageLoader.dataIsValid ? UIImage(data: imageLoader.data) ?? UIImage() : UIImage())
            .resizable()
            .aspectRatio(336/188, contentMode: .fit)
    }
}

