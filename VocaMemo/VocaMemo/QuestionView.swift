//
//  Question.swift
//  VocaMemo
//
//  Created by 이영준 on 2022/04/30.
//

import SwiftUI

struct QuestionView: View {
    @EnvironmentObject var allWord : AllWord

    var body: some View {
        VStack{
            HStack{
                Text("Bookmark")
                    .font(.title)
                    .bold()
                    .padding(.leading, 18)
                    
                Spacer()
            }
            .padding(.top, 15)
            
            List {
                ForEach(allWord.wordList){ word in
                    if word.bookmark {
                        VStack{
                            HStack{
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
                                        .frame(width: 18, height: 18)
                                        .foregroundColor(word.isOn ? .black : .gray)
                                        .padding(.top, 10)
                                }
                            }
                            
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
                }
            }.listStyle(.plain)
        }
    }
}

struct QuestionView_Previews: PreviewProvider {
    static var previews: some View {
        QuestionView()
    }
}
