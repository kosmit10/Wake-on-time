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
    @State private var imageOffset: CGFloat = -UIScreen.main.bounds.width / 2
    @State private var textOffset: CGFloat = UIScreen.main.bounds.width / 2
    @State private var buttonOffset: CGFloat = UIScreen.main.bounds.width
    @State private var backgroundOffset: CGFloat = UIScreen.main.bounds.width

    @State private var isShaking: Bool = false
    @State private var isContentViewPresented = false
    @State private var showLottieAnimation = true

    var body: some View {
        NavigationView {
            ZStack {
                Color(.black)
                RiveViewModel(fileName: "black_sky_with_shooting_stars-2").view()
          
                VStack {
                    HStack {
                        Image("logo")
                            .resizable()
                            .frame(width: 130, height: 130)
                            .offset(x: imageOffset)
                            .animation(.easeInOut(duration: 2), value: imageOffset)
                            .rotationEffect(.degrees(isShaking ? 15 : -5), anchor: .center)
                            .animation(isShaking ? Animation.linear(duration: 0.1).repeatForever(autoreverses: true) : .default, value: isShaking)
                            .padding()

                        Text("Wake \n on time")
                            .foregroundColor(.white)
                            .font(.custom("blackjack", size: 50))
                            .offset(x: textOffset)
                            .animation(.easeInOut(duration: 2), value: textOffset)
                            .padding(.top, 40.0)
                    }
                    .padding()
                    VStack {
                        ZStack {
                            NavigationLink(
                                destination: ContentView(),
                                isActive: $isContentViewPresented
                            ){
                                Button(action: {
                                    isContentViewPresented = true
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
                                .offset(x: buttonOffset)
                                .animation(.easeInOut(duration: 2), value: buttonOffset)
                            }
                        }
                    }
                }
            }
            .ignoresSafeArea()
            .onAppear {
                withAnimation {
                    imageOffset = 0
                    textOffset = 0
                    buttonOffset = 0
                    backgroundOffset = 0
                }
                DispatchQueue.main.asyncAfter(deadline: .now() + 0.7) {
                    isShaking = true
                }
                DispatchQueue.main.asyncAfter(deadline: .now() + 4.0) {
                    withAnimation {
                        showLottieAnimation = false
                    }
                }
            }
        }
    }
}

#Preview {
    startview()
}
