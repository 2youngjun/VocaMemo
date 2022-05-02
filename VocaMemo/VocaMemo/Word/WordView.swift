//
//  Word.swift
//  VocaMemo
//
//  Created by 이영준 on 2022/04/30.
//

import SwiftUI

struct WordView: View {
    @State private var showingSheet = false
    @State private var wordsView: [Bool] = [Bool](repeating: false, count: (load("wordData.json") as [Word]).count)
    @EnvironmentObject var allWord: AllWord
//    @State var searchText = ""
    
    func deleteWord(at offsets: IndexSet){
        allWord.wordList.remove(atOffsets: offsets)
        save(data: allWord.wordList)
    }
    
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
                ForEach(allWord.wordList) { word in
                    VStack{
                        HStack{
                            Text("\(word.wordName)")
                                .font(.system(size: 20))
                                .bold()
                            
                            Spacer()
                            
                            Button(action: {
//                                word.isOn.toggle()
                                var index = 0
                                for tempWord in allWord.wordList {
                                    if tempWord.id == word.id {
                                        break
                                    } else {
                                        index += 1
                                    }
                                }
                                allWord.wordList[index].isOn.toggle()
                            }){
                                Image(systemName: "chevron.down.circle")
                                    .resizable().aspectRatio(contentMode: .fit)
                                    .frame(width: 20, height: 20)
                                    .foregroundColor(.gray)
                            }
                        }
                        
                        VStack(spacing: 10){
                            HStack{
                                Text("\(word.meaning)")
                                    .font(.system(size: 16))
                                Spacer()
                            }
                            HStack{
                                Text("\(word.example)")
                                    .font(.system(size: 16))
                                Spacer()
                            }

                        }
                        .frame(width: .infinity, height: word.isOn ? 70 : 0)
                        .opacity(word.isOn ? 100 : 0)
                    }
                }
                .onDelete(perform: deleteWord)
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
