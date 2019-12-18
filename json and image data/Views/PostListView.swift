//
//  PostListView.swift
//  json and image data
//
//  Created by Hyung-Jin Kim on 2019/12/18.
//  Copyright © 2019 home. All rights reserved.
//

import Foundation
import SwiftUI
import Combine

struct PostListView: View {

    @ObservedObject var networkManager = NetworkManager(bBundle: true, name: "울트라비니군")
    
    init(name: String) {
        self.networkManager.jsonParsing(name: name)
    }
    
    var body: some View {
        List {
            // 동영상 리스트
            ForEach(networkManager.youtubeVideo, id: \.video_title) { youtubeVideo in
                NavigationLink(destination: VideoPlayerView(selectedVideoUrl: youtubeVideo.video_url)) {
                    VideoTitleRowView(youtubeVideo: youtubeVideo)
                }
            }.onDelete(perform: deleteRow)
        }.navigationBarTitle(Text(networkManager.youtuberName + " 동영상"), displayMode: .inline)// end ]
    }
    
    private func deleteRow(at offset: IndexSet) {
        self.networkManager.youtubeVideo.remove(atOffsets: offset)
    }
    
    public func callJsonpaser(_ name: String) {
        self.networkManager.jsonParsing(name: name)
    }

}
