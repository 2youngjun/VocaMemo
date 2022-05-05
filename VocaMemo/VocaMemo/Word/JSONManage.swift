//
//  JSONManage.swift
//  VocaMemo
//
//  Created by 이영준 on 2022/05/01.
//


// JSON 데이터의 모델을 만들어야 한다

import Foundation

// manager -> model of the word
struct Word: Codable, Identifiable {
    var id : Int
    var wordName, meaning, example, synoym: String
    var bookmark: Bool
    var isOn: Bool
    
//    mutating func toggleIsOn() {
//        self.isOn.toggle()
//    }
    
    // helper functions which are going to be available to the whole program
    // retrieve all word here
    // static let allWord: [Word] = Bundle.main.decode(file: "wordData.json")
    // -> this is going to return an array of word
    
    // for editing swiftui view, also providing example
    // static let sampleWord : Word = allWord[0]
}

// extension Word = Identifiable {}

func load<T: Decodable>(_ filename: String) -> T {
    let data: Data

    guard let file = Bundle.main.url(forResource: filename, withExtension: nil)
    else {
        fatalError("Couldn't find \(filename) in main bundle.")
    }

    do {
        data = try Data(contentsOf: file)
    } catch {
        fatalError("Couldn't load \(filename) from main bundle:\n\(error)")
    }

    do {
        let decoder = JSONDecoder()
        return try decoder.decode(T.self, from: data)
    } catch {
        fatalError("Couldn't parse \(filename) as \(T.self):\n\(error)")
    }
}


func save(data: [Word]) {
    let jsonEncoder = JSONEncoder()
    
    guard let file = Bundle.main.url(forResource: "wordData.json", withExtension: nil)
    else {
        fatalError("Couldn't find wordData.json in main bundle.")
    }
    
    do {
        let encodedData = try jsonEncoder.encode(data)
        
        do {
            try encodedData.write(to: file.standardizedFileURL)
        }
        catch let error as NSError {
            print(error)
        }
    } catch {
        print(error)
    }
}
