//
//  AllWord.swift
//  VocaMemo
//
//  Created by 이영준 on 2022/05/02.
//

import Foundation

final class AllWord: ObservableObject{
    @Published var wordList: [Word] = load("wordData.json")
    
    @Published var totalNumber = (load("wordData.json") as [Word]).count
}
