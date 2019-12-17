//
//  ContentView.swift
//  json and image data
//
//  Created by Hyung-Jin Kim on 2019/12/02.
//  Copyright © 2019 home. All rights reserved.
//

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

struct ContentView: View {
    @ObservedObject var dataSource = DataSource()
    // 번들에 있는 파일을 쓸것인지 확인하기 위해 Bool변수 설정
    // 폰에서는 번들을 써야하기 때문에
    @ObservedObject var networkManager = NetworkManager(bBundle: true, name: "PaulHudson")
        
    var body: some View {
        NavigationView {
            List {
            // List나 ForEach를 사용할때 identifiable을 사용했지만, 이제 아래와 같이 바뀌었다.
                VStack(alignment: .leading) {
                    // 상단 가로 리스트 [
                    Text("크리에이터").font(.headline).bold()
                    ScrollView(.horizontal, content: {
                        VStack(alignment: .leading) {
                            HStack(alignment: .top) {
                                ForEach(dataSource.jsons, id: \.self) { json in
                                    VStack(alignment: .center) {
                                        Image(String(json.split(separator: "_")[1].split(separator: ".")[0]))
                                            .resizable()
                                            .renderingMode(.original)
                                            .clipShape(Circle())
                                            .frame(width: 76, height: 76)
                                            .clipped()
                                        Text(json.split(separator: "_")[1].split(separator: ".")[0])
                                            .colorMultiply(.primary)
                                            .padding(.horizontal, 0)
                                            .font(.subheadline)
                                    }.frame(width: 76).onTapGesture {
                                        DispatchQueue.main.async {
                                            self.changeCreator(String(json.split(separator: "_")[1].split(separator: ".")[0]))
                                        }
                                    }
                                }
                            }
                        }
                    }).frame(height: 100)
                }
                // 동영상 리스트
                ForEach(networkManager.youtubeVideo, id: \.video_title) { youtubeVideo in
                    NavigationLink(destination: VideoPlayer(selectedVideoUrl: youtubeVideo.video_url)) {
                        VideoTitleRowView(youtubeVideo: youtubeVideo)
                    }
                }.onDelete(perform: deleteRow)
            }.navigationBarTitle(Text(networkManager.youtuberName + " 동영상"))// end ]
        }
    }
    
    private func deleteRow(at offset: IndexSet) {
        self.networkManager.youtubeVideo.remove(atOffsets: offset)
    }
    
    private func changeCreator(_ name: String) {
        DispatchQueue.main.async {
            self.networkManager.jsonParsing(name: name)
        }
    }
}

#if DEBUG
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
#endif
