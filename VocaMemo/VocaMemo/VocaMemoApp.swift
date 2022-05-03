//
//  VocaMemoApp.swift
//  VocaMemo
//
//  Created by 이영준 on 2022/04/30.
//

import SwiftUI

@main
struct VocaMemoApp: App {
    @StateObject private var allWord = AllWord()
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(allWord)
        }
    }
}
