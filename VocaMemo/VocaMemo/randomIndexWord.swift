//
//  randomIndexWord.swift
//  VocaMemo
//
//  Created by 이영준 on 2022/05/04.
//

import SwiftUI

struct randomIndexWord: View {
    @EnvironmentObject var allWord : AllWord
    let randomIndex = Int.random(in: 1..<(load("wordData.json") as [Word]).count)
    
    var body: some View {
        ZStack{
            Rectangle()
                .fill(Color("mainColor"))
                .cornerRadius(15)
                .frame(width: 350, height: 310, alignment: .center)
            
            VStack{
                Button(action: {
                    allWord.wordList[randomIndex].bookmark.toggle()
                }){
                    if allWord.wordList[randomIndex].bookmark {
                        Image(systemName: "bookmark.fill")
                            .resizable()
                            .foregroundColor(.yellow)
                            .frame(width: 20, height: 25)
                            .padding(EdgeInsets(top: 0, leading: 300, bottom: 0, trailing: 0))
                    } else {
                        Image(systemName: "bookmark")
                            .resizable()
                            .foregroundColor(.yellow)
                            .frame(width: 20, height: 25)
                            .padding(EdgeInsets(top: 0, leading: 300, bottom: 0, trailing: 0))
                    }
                }
                VStack{
                    Text("\(allWord.wordList[randomIndex].wordName)")
                        .font(.system(size: 40))
                        .foregroundColor(.white)
                        .bold()
                    
                    Spacer().frame(height: 20)

                    ZStack{
                        Rectangle()
                            .fill(.white)
                            .cornerRadius(10)
                            .frame(width: 280, height: 30)
                        Text("\(allWord.wordList[randomIndex].meaning)")
                            .font(.system(size: 16))
                            .bold()
                            .foregroundColor(Color("mainColor"))
                    }
                    
                    Spacer().frame(height: 10)

                    
                    
                    VStack{
                        Text("Example Sentence")
                            .font(.system(size: 14))
                            .foregroundColor(.white)
                            .bold()
                            .frame(width: 260, height: 10, alignment: .leading)

//                        Text("\(allWord.wordList[randomIndex].example)")
//                            .font(.system(size: 14))
//                            .foregroundColor(.white)
//                            .frame(width: 260, height: 60, alignment: .leading)
                        
                        GeometryReader { geometry in
                            DUILabel(exampleText: allWord.wordList[randomIndex].example, wordText: allWord.wordList[randomIndex].wordName)
                                .fixedSize(horizontal: true, vertical: true)
                        }
                        .frame(maxWidth: 260, maxHeight: 60)
                    }
                    .padding(EdgeInsets(top: 10, leading: 10, bottom: 10, trailing: 10))
                    .overlay(RoundedRectangle(cornerRadius: 10)
                        .stroke(Color.white, lineWidth: 1))
                    
                    Spacer().frame(height: 10)
                    
                    VStack{
                        Text("Synoym")
                            .font(.system(size: 14))
                            .foregroundColor(.white)
                            .bold()
                            .frame(width: 260, height: 10, alignment: .leading)

                        Text("\(allWord.wordList[randomIndex].synoym)")
                            .font(.system(size: 14))
                            .foregroundColor(.white)
                            .frame(width: 260, height: 20, alignment: .leading)
                    }
                    .padding(EdgeInsets(top: 10, leading: 10, bottom: 10, trailing: 10))
                    .overlay(RoundedRectangle(cornerRadius: 10)
                        .stroke(Color.white, lineWidth: 1))
                }
                .padding(.top, -20)
            }
        }
    }
}


struct DUILabel: UIViewRepresentable {
    var exampleText: String
    var wordText: String

    private(set) var preferredMaxLayoutWidth: CGFloat = 260
    func makeUIView(context: UIViewRepresentableContext<DUILabel>) -> UILabel {
        let label = UILabel()
        label.numberOfLines = 0
        label.text = exampleText
        label.preferredMaxLayoutWidth = self.preferredMaxLayoutWidth
        // label.font = UIFont.systemFont(ofSize: 14)
        label.textColor = UIColor.white
        
        let attributedString = NSMutableAttributedString(string: label.text!, attributes: [.font: UIFont.systemFont(ofSize: 14)])
        
        attributedString.addAttribute(.font, value: UIFont.systemFont(ofSize: 14, weight: .bold), range: (label.text! as NSString).range(of: "\(wordText)"))
        
        label.attributedText = attributedString
        
        return label
    }

    func updateUIView(_ uiView: UILabel, context: UIViewRepresentableContext<DUILabel>) { }
}
