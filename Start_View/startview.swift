import SwiftUI
import Lottie
import RiveRuntime

struct DiagonalBackground: Shape {
    func path(in rect: CGRect) -> Path {
        var path = Path()
        path.move(to: CGPoint(x: 0, y: 0))
        path.addLine(to: CGPoint(x: rect.width, y: 0))
        path.addLine(to: CGPoint(x: rect.width, y: rect.height))
        path.addLine(to: CGPoint(x: 0, y: rect.height * 0.45))
        path.closeSubpath()
        return path
    }
}

struct startview: View {
    @State private var imageOffset: CGFloat = -UIScreen.main.bounds.width / 1
    @State private var textOffset: CGFloat = UIScreen.main.bounds.width / 1
    @State private var buttonOffset: CGFloat = UIScreen.main.bounds.width

    @State private var isShaking: Bool = false
    @State private var isContentViewPresented = false
    @State private var showLottieAnimation = true

    var body: some View {
        ZStack {
            Color(.black)
            RiveViewModel(fileName: "black_sky_with_shooting_stars-2").view()
                .ignoresSafeArea()

            VStack {
                HStack {
                    Image("logo")
                        .resizable()
                        .frame(width: 90, height: 90)
                        .offset(x: imageOffset)
                        .animation(.easeInOut(duration: 1), value: imageOffset)
                        .padding()

                    Text("Wake \n on time")
                        .foregroundColor(.white)
                        .font(.custom("blackjack", size: 40))
                        .offset(x: textOffset)
                        .animation(.easeInOut(duration: 1), value: textOffset)
                        .padding(.top, 20.0)
                }
                .padding()

                VStack {
                    Button(action: {
                        withAnimation {
                            isContentViewPresented = true
                        }
                    }) {
                        if showLottieAnimation {
                            LottieView(animationName: "loading")
                                .frame(width: 150, height: 150)
                                .scaleEffect(1)
                                .padding(.bottom, 30.0)
                        } else {
                            Image(systemName: "arrowshape.turn.up.right.circle.fill")
                                .foregroundColor(.white)
                                .font(.system(size: 40))
                        }
                    }
                    .padding(.bottom, 30.0)
                    .offset(y: buttonOffset)
                    .animation(.easeInOut(duration: 1), value: buttonOffset)
                }
            }
            .padding(.bottom, -120.0)
        }
        .ignoresSafeArea()
        .onAppear {
            withAnimation {
                imageOffset = 0
                textOffset = 0
                buttonOffset = 0
            }
            DispatchQueue.main.asyncAfter(deadline: .now() + 1.6) {
                isShaking = false
            }
            DispatchQueue.main.asyncAfter(deadline: .now() + 4.0) {
                withAnimation {
                    showLottieAnimation = false
                }
            }
        }
        .fullScreenCover(isPresented: $isContentViewPresented, content: {
            ContentView()
                .transition(.move(edge: .bottom))
                .animation(.easeInOut)
        })
    }
}

#Preview {
    startview()
}
