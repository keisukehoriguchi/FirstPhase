//
//  WebView.swift
//  FirstPhase
//
//  Created by Keisuke Horiguchi on 2021/06/09.
//

import SwiftUI
import WebKit

struct WebView : UIViewRepresentable {
    let request: URLRequest
    func makeUIView(context: Context) -> WKWebView {
        return WKWebView()
    }
    
    func updateUIView(_ uiView: WKWebView, context: Context) {
        uiView.load(request)
    }
}
