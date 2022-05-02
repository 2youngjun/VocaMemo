//
//  AllWord.swift
//  VocaMemo
//
//  Created by 이영준 on 2022/05/02.
//

import Foundation

final class AllWord: ObservableObject{
    @Published var wordList: [Word] = load("wordData.json")
    
    // @Published var wordsCount = (load("wordData.json") as [Word]).count
    
    // @Published var wordsView: [Bool] = [Bool](repeating: false, count: (load("wordData.json") as [Word]).count)
    
}
