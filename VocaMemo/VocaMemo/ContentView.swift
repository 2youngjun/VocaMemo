//
//  ContentView.swift
//  VocaMemo
//
//  Created by 이영준 on 2022/04/30.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationView{
            VStack{
                Spacer()
                Text("Voca Memo")
                    .font(Font.custom("Noteworthy", size: 40, relativeTo: .title))
                    .foregroundColor(.purple)
                
                NavigationLink(destination: Word()){
                    Text("Start")
                        .font(.title2)
                        .foregroundColor(.black)
                        .padding(EdgeInsets(top: 10, leading: 5, bottom: 10, trailing: 10))
                }
                .background(RoundedRectangle(cornerRadius: 20)
                    .fill(Color.purple))
                Spacer()
            }
        }
        .navigationBarHidden(true)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
