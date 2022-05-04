//
//  ContentView.swift
//  VocaMemo
//
//  Created by 이영준 on 2022/04/30.
//

import SwiftUI

struct ContentView: View {
    @State private var selection = 1
    var body: some View {
        TabView(selection: $selection){
            QuestionView()
                .tabItem{
                    Image(systemName: "questionmark.circle")
                    Text("Question")
                }.tag(0)
            WordView()
                .tabItem{
                    Image(systemName: "pencil.tip.crop.circle")
                    Text("Word")
                }.tag(1)
            CheckView()
                .tabItem{
                    Image(systemName: "checkmark.circle")
                    Text("Check")
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
