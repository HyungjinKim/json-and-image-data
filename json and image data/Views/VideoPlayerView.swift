//
//  VideoPlayerView.swift
//  json and image data
//
//  Created by Hyung-Jin Kim on 2019/12/03.
//  Copyright © 2019 home. All rights reserved.
//

import Foundation
import SwiftUI

struct VideoPlayer: View {
    var selectedVideoUrl: String

    var body: some View {
        VStack {
            //player(videoUrl: selectedVideoUrl).frame(height: UIScreen.main.bounds.height / 3)
            Webview(url: selectedVideoUrl)
            //Spacer()
        }
    }
}

