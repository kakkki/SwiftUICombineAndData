//
//  ContentView.swift
//  SwiftUICombineAndData
//
//  Created by Atsuki Kakehi on 2021/12/10.
//

import SwiftUI

struct ContentView: View {
    
    @State private var contentOffset = CGFloat(0)
    
    var body: some View {
        NavigationView {
            ZStack(alignment: .top) {
                TrackableScrollView(offsetChanged: { offsetPoint in
                    contentOffset = offsetPoint.y
                    print("contentOffset", contentOffset)
                }) {
                    Text("Hello, world!")
                        .padding()
                }
                VisualEffectBlur(blurStyle: .systemMaterial)
                    .opacity(contentOffset < -16 ? 1 : 0)
                    .animation(.easeIn)
                    .ignoresSafeArea()
                    .frame(height: 0)
            }
            .frame(maxHeight: .infinity, alignment: .top)
            .background(AccountBackground())
            .navigationBarHidden(true)
        }
        .navigationViewStyle(StackNavigationViewStyle())
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
