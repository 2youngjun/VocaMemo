//
//  ContentView.swift
//  VocaMemo
//
//  Created by 이영준 on 2022/04/30.
//

import SwiftUI

struct ContentView: View {
    @State private var selection = 0
    var body: some View {
        TabView(selection: $selection){
            CheckView()
                .tabItem{
                    Image(systemName: "checkmark.circle")
                    Text("Daily")
                }.tag(0)
            WordView()
                .tabItem{
                    Image(systemName: "book")
                    Text("Word")
                }.tag(1)
            QuestionView()
                .tabItem{
                    Image(systemName: "bookmark.circle")
                    Text("Bookmark")
                }.tag(2)
        }
        .onAppear() {
            UITabBar.appearance().barTintColor = .white
        }
        .accentColor(Color("mainColor"))
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
