//
//  ContentView.swift
//  Wake on time
//
//  Created by maciura on 23/06/2024.
//

import SwiftUI

struct startview: View {
    @State private var imageOffset: CGFloat = -UIScreen.main.bounds.width / 2
    @State private var textOffset: CGFloat = UIScreen.main.bounds.width / 2
    @State private var buttonOffset: CGFloat = UIScreen.main.bounds.width / 1

    @State private var isShaking: Bool = false
    var body: some View {
        ZStack {
            VStack {
                HStack {
                    Image("logo")
                        .resizable()
                        .frame(width: 80, height: 80)
                        .offset(x: imageOffset)
                        .animation(.easeInOut(duration: 2), value: imageOffset)
                        .rotationEffect(.degrees(isShaking ? 15 : -5), anchor: .center)
                        .animation(isShaking ? Animation.linear(duration: 0.1).repeatForever(autoreverses: true) : .default, value: isShaking)
                    Text("Wake \n on time")
                        .offset(x: textOffset)
                        .font(.largeTitle)
                        .animation(.easeInOut(duration: 2), value: textOffset)
                        .padding(.top, 40.0)
                }
                .padding()
                
                Button(action: {
                    
                }){
                    Image(systemName: "arrowshape.turn.up.right.circle.fill")
                        .foregroundColor(.black)
                        .font(.system(size: 40))
                }
                .offset(x: buttonOffset)
                .animation(.easeInOut(duration: 2), value: buttonOffset)
            }
        }
        .onAppear {
            withAnimation {
                imageOffset = 0
                textOffset = 0
                buttonOffset = 0
            }
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.7) {
                isShaking = true
            }
        }
    }
}

#Preview {
    startview()
}
