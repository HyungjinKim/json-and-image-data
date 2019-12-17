//
//  VideoTitleListView.swift
//  json and image data
//
//  Created by Hyung-Jin Kim on 2019/12/03.
//  Copyright © 2019 home. All rights reserved.
//

import Foundation
import SwiftUI

struct VideoTitleRowView: View {
    let youtubeVideo: Youtube
        
    var body: some View {
        VStack (alignment: .leading) {
            ImageViewWidget(imageUrl: youtubeVideo.thumbnail_img)
            HStack {
                Text(youtubeVideo.video_title).font(.subheadline)
                Text(youtubeVideo.view_count).font(.subheadline)
            }
        }
    }
}

