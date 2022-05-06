//
//  WordSheetView.swift
//  VocaMemo
//
//  Created by 이영준 on 2022/05/01.
//

import SwiftUI

struct WordSheetView: View {
    @State private var wordName = ""
    @State private var wordMeaning = ""
    @State private var wordExample = ""
    @State private var wordSynoym = ""
    
    @Environment(\.presentationMode) var presentationMode
    @EnvironmentObject var allWord : AllWord
    
    func addWord(){
        allWord.wordList.insert(Word(id: allWord.totalNumber + 1, wordName: wordName, meaning: wordMeaning, example: wordExample, synoym: wordSynoym, bookmark: false, isOn: false), at: 0)
        allWord.totalNumber += 1
        save(data: allWord.wordList)
    }
    
    var body: some View {
        VStack{
            HStack{
                Text("Add Word")
                    .font(.title)
                    .bold()
                    .padding(EdgeInsets(top: 15, leading: 18, bottom: 0, trailing: 0))
                Spacer()
                
                Button(action: {
                    addWord()
                    
                    self.presentationMode.wrappedValue.dismiss()
                }){
                    Text("Submit")
                        .font(.body)
                        .foregroundColor(Color("mainColor"))
                        .bold()
                        .padding(EdgeInsets(top: 15, leading: 0, bottom: 0, trailing: 18))
                        .overlay(
                            RoundedRectangle(cornerRadius: 20)
                                .stroke(Color("mainColor"), lineWidth: 2)
                                .frame(width: 75, height: 30)
                                .padding(EdgeInsets(top: 15, leading: 0, bottom: 0, trailing: 18))
                        )
                }
                
            }
            
            Form{
                Text("Word")
                    .foregroundColor(.brown)
                    .bold()
                TextField("Type Word", text: $wordName)
                    .textInputAutocapitalization(.never)
                    .disableAutocorrection(true)
                
                Text("Meaning")
                    .foregroundColor(.brown)
                    .bold()
                TextField("Type Meaning", text: $wordMeaning)
                    .disableAutocorrection(true)
                
                Text("Example")
                    .foregroundColor(.brown)
                    .bold()
                TextField("Type Example", text: $wordExample)
                    .disableAutocorrection(true)
                
                Text("Synoym")
                    .foregroundColor(.brown)
                    .bold()
                TextField("Type Synoym", text: $wordSynoym)
                    .disableAutocorrection(true)
            }
            
            Spacer()
        }
    }
}

