//
//  ContentView.swift
//  SwiftUIDemo
//
//  Created by 이아연 on 2021/06/17.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
    
        List {
            Button(action : {
                print("Hello, SwiftUI!!~!")
            }) {
                Text("SwiftUI")
                    .font(.title)
                    .foregroundColor(.pink)
            }
            
            Text("First")
            Text("Second")
            Text("Third")
            Text("Fourth")
            Text("Fifth")
            Text("Sixth")
            Text("Seventh")
            Text("Eighth")
            Text("Ninth")
        }.font(.largeTitle)
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
