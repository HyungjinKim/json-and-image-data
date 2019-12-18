//
//  ContentView.swift
//  json and image data
//
//  Created by Hyung-Jin Kim on 2019/12/02.
//  Copyright © 2019 home. All rights reserved.
//

import SwiftUI
import Combine

struct ContentView: View {
    @ObservedObject var dataSource = DataSource()
    //@ObservedObject var networkManager = NetworkManager(bBundle: true, name: "PaulHudson")

    var body: some View {
        NavigationView {
            VStack {
                ScrollView(.horizontal, showsIndicators: false) {
                    HStack {
                        ForEach(dataSource.jsons, id: \.self) { json in
                            NavigationLink(destination: PostListView(name: String(json.split(separator: "_")[1].split(separator: ".")[0]))) {
                                CardView(img: String(json.split(separator: "_")[1].split(separator: ".")[0])).padding(50)
                            }
                        }
                    }
                }
            }.navigationBarTitle(Text("목록"), displayMode: .automatic)
        }
    }
}

struct CardView: View {
    var img = ""
    
    var body: some View {
        VStack {
            Image(img).renderingMode(.original).cornerRadius(20).shadow(radius: 20)
            
        }.frame(width: 200, height: 400)
    }
}

#if DEBUG
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
#endif
