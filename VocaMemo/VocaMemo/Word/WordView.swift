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
    @State private var wordsView: [Bool] = [Bool](repeating: false, count: Word.allWord.count)

    var body: some View {
        VStack{
            HStack{
                Text("Word List")
                    .font(.title)
                    .bold()
                    //.foregroundColor(Color("mainColor"))
                    .padding(.leading, 18)
                    
                Spacer()
                
                Button(action: {
                    self.showingSheet.toggle()
                }){
                    Image(systemName: "pencil.tip.crop.circle.badge.plus")
                        .resizable().aspectRatio(contentMode: .fit)
                        .foregroundColor(Color("mainColor"))
                        .frame(width: 30, height: 30)
                        .padding(.trailing, 18)
                }
                .sheet(isPresented: $showingSheet){
                    WordSheetView()
                }
            }
            .padding(.top, 15)
            .padding(.bottom, 15)
            
            List{
                ForEach(words.indices) { index in
                    VStack{
                        HStack{
                            Text("\(words[index].wordName)")
                                .font(.system(size: 20))
                                .bold()
                            
                            Spacer()
                            
                            Button(action: {
                                    wordsView[index].toggle()
                            }){
                                Image(systemName: "chevron.down.circle")
                                    .resizable().aspectRatio(contentMode: .fit)
                                    .frame(width: 20, height: 20)
                                    .foregroundColor(.gray)
                            }
                        }
                        
                        VStack(spacing: 10){
                            HStack{
                                Text("\(words[index].meaning)")
                                    .font(.system(size: 16))
                                Spacer()
                            }
                            HStack{
                                Text("\(words[index].example)")
                                    .font(.system(size: 16))
                                Spacer()
                            }

                        }
                        .frame(width: .infinity, height: wordsView[index] ? 70 : 0)
                        .opacity(wordsView[index] ? 100 : 0)
                    }
                }
            }
            .listStyle(PlainListStyle())
            
            Spacer()
            
            
        }
    }
}

struct WordView_Previews: PreviewProvider {
    static var previews: some View {
        WordView()
    }
}
