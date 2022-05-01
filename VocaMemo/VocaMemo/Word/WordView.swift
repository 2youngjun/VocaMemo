//
//  Word.swift
//  VocaMemo
//
//  Created by 이영준 on 2022/04/30.
//

import SwiftUI

struct WordView: View {
    @State private var showingSheet = false
    @State private var words: [Word] = Word.allWord
    
    var body: some View {
        VStack{
            HStack{
                Text("Word List")
                    .font(.title)
                    //.foregroundColor(Color("mainColor"))
                    .padding(.leading, 15)
                    
                Spacer()
                
                Button(action: {
                    self.showingSheet.toggle()
                }){
                    Image(systemName: "pencil.tip.crop.circle.badge.plus")
                        .resizable().aspectRatio(contentMode: .fit)
                        .foregroundColor(Color("mainColor"))
                        .frame(width: 30, height: 30)
                        .padding(.trailing, 15)
                }
                .sheet(isPresented: $showingSheet){
                    WordSheetView()
                }
            }
            .padding(.top, 15)
            .padding(.bottom, 15)
            
            List{
                ForEach(words, id: \.wordName) { word in
                    HStack{
                        Text("\(word.wordName)")
                        Spacer()
                        
                    }
                }
            }
            
            
            Spacer()
            
            
        }
    }
}

struct WordView_Previews: PreviewProvider {
    static var previews: some View {
        WordView()
    }
}
