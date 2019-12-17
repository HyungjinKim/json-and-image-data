//
//  PostView.swift
//  json and image data
//
//  Created by Hyung-Jin Kim on 2019/12/03.
//  Copyright © 2019 home. All rights reserved.
//

import Foundation
import SwiftUI
import Combine

struct PostView {
    var networkManager: NetworkManager

//    var body: some View {
        // List나 ForEach를 사용할때 identifiable을 사용했지만, 이제 아래와 같이 바뀌었다.
//            List {
//                ForEach(self.networkManager.youtubeVideo, id: \.video_title) { youtubeVideo in
//                    NavigationLink(destination: VideoPlayer(selectedVideoUrl: youtubeVideo.video_url)) {
//                        VideoTitleRowView(youtubeVideo: youtubeVideo)
//                    }
//                }.onDelete(perform: deleteRow)
//            }
//    }

    private func deleteRow(at offset: IndexSet) {
        self.networkManager.youtubeVideo.remove(atOffsets: offset)
    }
}
