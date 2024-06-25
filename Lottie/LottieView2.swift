//
//  animation_click.swift
//  Wake on time
//
//  Created by maciura on 24/06/2024.
//

import UIKit
import Lottie
class LottieView2: UIViewController {
    var animationView: AnimationView?
    override func viewDidLoad() {
        super.viewDidLoad()
        animationView = .init(name: "click")
        animationView?.frame = view.bounds
        view.addSubview (animationView!)
        animationView?.play()
    }
}
#Preview{
    LottieView2()
}
