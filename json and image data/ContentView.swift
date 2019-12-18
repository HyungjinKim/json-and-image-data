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
    //@ObservedObject var networkManager = NetworkManager(bBundle: true, name: "PaulHudson")

    var body: some View {
        VStack {
//                Text("Youtuber List").font(.largeTitle).foregroundColor(.white)
            HomeView()
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
