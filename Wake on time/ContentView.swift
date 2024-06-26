//
//  ContentView.swift
//  Wake on time
//
//  Created by maciura on 23/06/2024.
//

import SwiftUI
import RiveRuntime

struct ContentView: View {
    var body: some View {
        ZStack {
            RiveViewModel(fileName: "shape").view()
                .blur(radius: 30)
                .scaleEffect(2.7)
                .ignoresSafeArea()
                .background(
                    Image("black")
                        .blur(radius: 50)
                        .offset(x: 200, y: 100))
            VStack {
                HStack{
                    Text("Szacowany czas podróży\n            -")
                        .frame(width: 150, height: 70)
                        .background(.blue)
                        .foregroundColor(.white)
                        .shadow(color: .blue, radius: 10, x: 0, y: 0)
                    Spacer()
                    Text("Dojazd o godzine\n              -")
                        .frame(width: 150, height: 70)
                        .background(.blue)
                        .foregroundColor(.white)
                        .shadow(color: .blue, radius: 10, x: 0, y: 0)
                }
                .padding()
                
                
            }
            .padding()
        }
    }
}

#Preview {
    ContentView()
}
