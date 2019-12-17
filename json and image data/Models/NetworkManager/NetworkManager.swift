//
//  NetworkManager.swift
//  json and image data
//
//  Created by Hyung-Jin Kim on 2019/12/03.
//  Copyright © 2019 home. All rights reserved.
//

import Foundation
import SwiftUI
import Combine

/*
 BindableObject를 사용했지만, update 되면서 삭제됐다.
 ObservableObject를 쓰면서 @Published를 붙여야 List에 뿌린다.
 */
class NetworkManager: ObservableObject {
    var _bBundle: Bool
    var _jsonFileName: String
    var _jsonFilePath: String?
    private var request: URLRequest?
    @Published var youtuberName: String

    let objectWillChange = PassthroughSubject<NetworkManager, Never>()
    
    @Published var youtubeVideo = [Youtube]() {
        willSet {
            objectWillChange.send(self)
        }
    }
    
    @Published var isLoading = false

    init(bBundle: Bool, name: String) {
        youtuberName = name
        _bBundle = bBundle
        _jsonFileName = "youtube_" + name
        jsonParsing(name: name)
    }
    
    func jsonParsing(name: String) {
        _jsonFileName = "youtube_" + name
        isLoading = true
        // bundle일때와 url or local file일때를 나눠서 처리 [
        if _bBundle {
            _jsonFilePath = Bundle.main.path(forResource: _jsonFileName, ofType: "json")
            //let url = URL(fileURLWithPath: _jsonFilePath!)
            //request = URLRequest(url: url)
        } else {
            //_jsonFilePath = "file:///Users/antoniokr/Develope/python/selenium/json/" + _jsonFileName
            // 한글이 포함된 파일을 읽기 위해
            let url = URL(string: "https://www.dropbox.com/home/Develope/json?preview=youtuber_%EC%9A%B8%ED%8A%B8%EB%9D%BC%EB%B9%84%EB%8B%88%EA%B5%B0_0.json")!
            request = URLRequest(url: url)
        }
        //objectWillChange.send(self)
        // end
        URLSession.shared.dataTask(with: URL(fileURLWithPath: _jsonFilePath!)) { (data, _, error) in
            do {
                guard let data = data else { return }
                let youtubeVideo = try! JSONDecoder().decode([Youtube].self, from: data)
                DispatchQueue.main.async {
                    self.isLoading = false
                    self.youtubeVideo = youtubeVideo
                    self.youtuberName = name
                }
            } catch {
                print("Error")
            }
        }.resume()

        //self.distance = newDistance
    }
}
