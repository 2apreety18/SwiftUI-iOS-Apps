//
//  ContentView.swift
//  GridSwiftUI
//
//  Created by preety on 15/10/20.
//  Copyright © 2020 Preety. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    
    let animals = ["🐅","🦕","🐘","🐄","🦓","🦜","🐿","🦩"]
    @State private var sliderValue: CGFloat = 1
    
    var body: some View {
        NavigationView {
            
            VStack{ //going through array -- id
                
                Slider(value: $sliderValue, in: 1...8, step: 1)
                Text(String(format: "%.0f", self.sliderValue))
                    .font(.system(size: 20))
                    .fontWeight(.bold)
                    .padding()
                    .background(Color.purple)
                    .foregroundColor(Color.white)
                    .clipShape(Circle())
                
                List(self.animals.chunks(size: Int(self.sliderValue)), id:\.self){ chunk in
                    ForEach(chunk, id: \.self) { animal in
                        Text(animal)
                            .font(.system(size: CGFloat(300/self.sliderValue)))
                    }
                    
                }
            }
            
            .navigationBarTitle("Animals")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
