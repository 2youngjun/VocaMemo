//
//  Check.swift
//  VocaMemo
//
//  Created by 이영준 on 2022/04/30.
//

import SwiftUI

struct CheckView: View {
    var body: some View {
        VStack{
            HStack{
                Text("Today's Word")
                    .font(.title)
                    .bold()
                    .padding(.leading, 18)
                    
                Spacer()
            }
            .padding(.top, 15)
            
            randomIndexWord()
            
            Spacer()
            
            randomIndexWord()
            
            Spacer()
        }
    }
}

