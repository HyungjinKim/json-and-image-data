//
//  VideoPlayer.swift
//  json and image data
//
//  Created by Hyung-Jin Kim on 2019/12/03.
//  Copyright © 2019 home. All rights reserved.
//

import Foundation
import SwiftUI
import Combine
import AVKit

struct player: UIViewControllerRepresentable {
    let url: String
    init(videoUrl: String) {
        self.url = videoUrl
    }
    
    func makeUIViewController(context: UIViewControllerRepresentableContext<player>) ->
    AVPlayerViewController {
        let controller  = AVPlayerViewController()
        let player1 = AVPlayer(url: URL(string: url)!)
        controller.player = player1
        return controller
    }
    
    func updateUIViewController(_ uiViewController: AVPlayerViewController, context:
        UIViewControllerRepresentableContext<player>) {
    
    }
}

