//
//  HomeView.swift
//  json and image data
//
//  Created by Hyung-Jin Kim on 2019/12/19.
//  Copyright © 2019 home. All rights reserved.
//

import Foundation
import SwiftUI

//let coloredNavAppearance = UINavigationBarAppearance()

struct HomeView: View {
    @ObservedObject var dataSource = DataSource()

    init() {
        /*
        coloredNavAppearance.configureWithOpaqueBackground()
        coloredNavAppearance.backgroundColor = .systemRed
        coloredNavAppearance.titleTextAttributes = [.foregroundColor: UIColor.white]
        coloredNavAppearance.largeTitleTextAttributes = [.foregroundColor: UIColor.white]
        */
        // displayMode inline
        UINavigationBar.appearance().titleTextAttributes = [.foregroundColor: UIColor.black]
        // displayMode automatic and large
        UINavigationBar.appearance().largeTitleTextAttributes = [.foregroundColor: UIColor.white]
    }
    
    var body: some View {
        NavigationView {
            ZStack {
                LinearGradient(gradient: Gradient(colors: [Color.red, Color.orange]), startPoint: .top, endPoint: .bottom)
                .edgesIgnoringSafeArea(.all)
                ScrollView(.horizontal, showsIndicators: false) {
                    HStack {
                        ForEach(dataSource.jsons, id: \.self) { json in
                            NavigationLink(destination: PostListView(name: String(json.split(separator: "_")[1].split(separator: ".")[0]))) {
                                CardView(img: String(json.split(separator: "_")[1].split(separator: ".")[0])).padding(50)
                            }
                        }
                    }
                }
            }.navigationBarTitle(Text("Youtube List"), displayMode: .automatic)
        }
    }
}
