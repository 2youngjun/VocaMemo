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
    @State private var searchText = ""
    
    func deleteWord(at offsets: IndexSet){
        allWord.wordList.remove(atOffsets: offsets)
        save(data: allWord.wordList)
    }
    
    var body: some View {
        NavigationView{
            VStack{
                HStack{
                    Text("Word List")
                        .font(.title)
                        .bold()
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
                
                List{
                    ForEach(allWord.wordList) { word in
                        VStack{
                            HStack{
                                Button(action: {
                                    var index = 0
                                    for tempWord in allWord.wordList {
                                        if tempWord.id == word.id {
                                            break
                                        } else {
                                            index += 1
                                        }
                                    }
                                    allWord.wordList[index].bookmark.toggle()
                                }){
                                    if word.bookmark {
                                        Image(systemName: "bookmark.fill")
                                            .resizable()
                                            .foregroundColor(.yellow)
                                            .frame(width: 12, height: 17)
                                            .padding(EdgeInsets(top: 10, leading: 0, bottom: 0, trailing: 0))
                                    } else {
                                        Image(systemName: "bookmark")
                                            .resizable()
                                            .foregroundColor(.yellow)
                                            .frame(width: 12, height: 17)
                                            .padding(EdgeInsets(top: 10, leading: 0, bottom: 0, trailing: 0))
                                    }
                                }
                                
                                if word.isOn {
                                    Text("\(word.wordName)")
                                        .font(.system(size: 18))
                                        .bold()
                                        .padding(.top, 10)
                                } else{
                                    Text("\(word.wordName)")
                                        .font(.system(size: 18))
                                        .padding(.top, 10)
                                }
                                
                                Spacer()
                                
                                Button(action: {
    //                                word.isOn.toggle()
                                    var index2 = 0
                                    for tempWord2 in allWord.wordList {
                                        if tempWord2.id == word.id {
                                            break
                                        } else {
                                            index2 += 1
                                        }
                                    }
                                    allWord.wordList[index2].isOn.toggle()
                                }){
                                    Image(systemName: "chevron.down.circle")
                                        .resizable().aspectRatio(contentMode: .fit)
                                        .frame(width: 18, height: 18)
                                        .foregroundColor(word.isOn ? .black : .gray)
                                        .padding(.top, 10)
                                }
                            }.buttonStyle(BorderlessButtonStyle())
                            
                            VStack(spacing: 10){
                                HStack{
                                    Text("\(word.meaning)")
                                        .font(.system(size: 14))
                                        .foregroundColor(.gray)
                                    Spacer()
                                }
                                HStack{
//                                    var tempExample = word.example
                                    GeometryReader { geometry in
                                        SUILabel(exampleText: word.example, wordText: word.wordName, preferredMaxLayoutWidth: geometry.size.width)
                                            .fixedSize(horizontal: true, vertical: true)
                                    }
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
            }.navigationBarHidden(true)
        }
    }
}

struct WordView_Previews: PreviewProvider {
    static var previews: some View {
        WordView()
    }
}


struct SUILabel: UIViewRepresentable {
    var exampleText: String
    var wordText: String

    private(set) var preferredMaxLayoutWidth: CGFloat = 0
    func makeUIView(context: UIViewRepresentableContext<SUILabel>) -> UILabel {
        let label = UILabel()
        label.numberOfLines = 3
        label.text = exampleText
        label.preferredMaxLayoutWidth = self.preferredMaxLayoutWidth
        // label.font = UIFont.systemFont(ofSize: 14)
        // label.textColor = UIColor.brown
        
        let attributedString = NSMutableAttributedString(string: label.text!, attributes: [.font: UIFont.systemFont(ofSize: 14)])
        
        attributedString.addAttribute(.font, value: UIFont.systemFont(ofSize: 14, weight: .bold), range: (label.text! as NSString).range(of: "\(wordText)"))
        
        label.attributedText = attributedString
        
        return label
    }

    func updateUIView(_ uiView: UILabel, context: UIViewRepresentableContext<SUILabel>) { }
}
