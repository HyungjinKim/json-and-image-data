//
//  CreatorView.swift
//  json and image data
//
//  Created by Hyung-Jin Kim on 2019/12/16.
//  Copyright © 2019 home. All rights reserved.
//

import Foundation
import SwiftUI
import Combine

struct CreatorView: View {
    var dataSource: DataSource
    var networkManager: NetworkManager
    
    var body: some View {
        ScrollView(.horizontal, content: {
            Text("크리에이터").padding()
            VStack(alignment: .leading) {
                HStack(alignment: .top) {
                    ForEach(self.dataSource.jsons, id: \.self) { json in
                        VStack(alignment: .center) {
                            Image(String(json.split(separator: "_")[1].split(separator: "_")[0]))
                                .resizable()
                                .renderingMode(.original)
                                .clipShape(Circle())
                                .frame(width: 76, height: 76)
                                .clipped()
                            Text(json.split(separator: "_")[1].split(separator: "_")[0])
                                .colorMultiply(.primary)
                                .padding(.horizontal, 0)
                                .font(.subheadline)
                        }.frame(width: 76).onTapGesture {
                            //self.changeCreator(String(json.split(separator: "_")[1].split(separator: "_")[0]))
                        }
                    }.padding(5)
                }
                PostView(networkManager: self.networkManager)
            }
        }).frame(height: 100)
    }
    
    private func changeCreator(_ name: String) {
        self.networkManager.youtuberName = name
        self.networkManager._bBundle = true
        self.networkManager._jsonFileName = "youtuber_" + self.networkManager.youtuberName + "_0"
        self.networkManager.jsonParsing()
    }
}
