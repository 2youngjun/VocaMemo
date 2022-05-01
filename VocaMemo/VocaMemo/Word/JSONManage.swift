//
//  JSONManage.swift
//  VocaMemo
//
//  Created by 이영준 on 2022/05/01.
//


// JSON 데이터의 모델을 만들어야 한다

import Foundation

// manager -> model of the word
struct Word: Codable {
    // let id : UUID = UUID()
    
    var wordName, meaning, example: String
    var bookmark: Bool
    
    // helper functions which are going to be available to the whole program
    // retrieve all word here
    static let allWord: [Word] = Bundle.main.decode(file: "wordData.json")
    // -> this is going to return an array of word
    
    // for editing swiftui view, also providing example
    static let sampleWord : Word = allWord[0]
}

// extension Word = Identifiable {}

// way to decode json data
extension Bundle {
    func decode<T: Decodable>(file: String) -> T {
        guard let url = self.url(forResource: file, withExtension: nil) else {
            fatalError("Could not find \(file) in the project!")
        }
        guard let data = try? Data(contentsOf: url) else {
            fatalError("Could not load \(file) in the project!")

        }
        let decoder = JSONDecoder()
        
        guard let loadedData = try? decoder.decode(T.self, from: data) else {
            fatalError("Could not decode \(file) in the project!")
        }
        
        return loadedData
    }
}
