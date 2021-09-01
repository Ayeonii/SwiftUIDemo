//
//  ContentView.swift
//  SwiftUIDemo
//
//  Created by 이아연 on 2021/06/17.
//

import SwiftUI

struct ContentView: View {
    
    //@State -> Struct는 내부 프로퍼티를 변경할 수 없지만, @State 키워드를 붙이면 가능합. Swift 5.1부터 제공.
    @State var touchedCount : Int = 0
    var body: some View {
        NavigationView {
            Form{
                Text("Hello World")
                Text("2Hello World")
                Text("3Hello World")
                Text("4Hello World")
                Text("5Hello World")
                Text("6Hello World")
                Text("8Hello World")
                Text("Button 클릭 횟수 : \(touchedCount)")
                Button("Button임") {
                    print("오..신세계..!")
                    touchedCount += 1
                }
                
                Group {
                    Text("Group2 Hello World")
                    Text("Group3 Hello World")
                    Text("Group4 World")
                }
            }.navigationTitle("Navigation 타이틀")
        }
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
