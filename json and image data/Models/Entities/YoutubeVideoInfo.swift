//
//  YoutubeVideoInfo.swift
//  json and image data
//
//  Created by Hyung-Jin Kim on 2019/12/03.
//  Copyright © 2019 home. All rights reserved.
//

import Foundation
import SwiftUI

struct Youtube: Decodable {
    let video_title, video_url, thumbnail_img, view_count: String
}

struct Movie: Decodable {
    let title, year: String
}

