//
//  Webview.swift
//  json and image data
//
//  Created by Hyung-Jin Kim on 2019/12/03.
//  Copyright © 2019 home. All rights reserved.
//

import Foundation
import SwiftUI
import WebKit

struct Webview: UIViewRepresentable {
    
    var url: String
    
    func makeUIView(context: Context) -> WKWebView {
        
        let videoKey = self.url.split(separator: "=")
        let convertUrl = "https://www.youtube.com/embed/" + videoKey[1]

        guard let url = URL(string: convertUrl) else {
            return WKWebView()
        }
                
        let request = URLRequest(url: url)
        let wkWebview = WKWebView()
        wkWebview.load(request)
        return wkWebview
    }
    
    func updateUIView(_ uiView: WKWebView, context:
        UIViewRepresentableContext<Webview>) {
        
    }
}
