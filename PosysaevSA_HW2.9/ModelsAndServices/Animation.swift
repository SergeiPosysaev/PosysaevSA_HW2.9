//
//  Animation.swift
//  PosysaevSA_HW2.9
//
//  Created by Sergei Posysaev on 10.11.2020.
//

struct DemoAnimation {
    
    enum Curves: String {
        
        case easeIn,
            easeOut,
            easeInOut,
            linear,
            spring,
            easeInSine,
            easeOutSine,
            easeInOutSine,
            easeInQuad,
            easeOutQuad,
            easeInOutQuad,
            easeInCubic,
            easeOutCubic,
            easeInOutCubic,
            easeInQuart,
            easeOutQuart,
            easeInOutQuart,
            easeInQuint,
            easeOutQuint,
            easeInOutQuint,
            easeInExpo,
            easeOutExpo,
            easeInOutExpo,
            easeInCirc,
            easeOutCirc,
            easeInOutCirc,
            easeInBack,
            easeOutBack,
            easeInOutBack
    }
    
    let animationPrezet: String
    let force: Double
    let curves: Curves
    let duration: Double
    let delay: Double
    
}

extension DemoAnimation {
    
     static func createModels() -> [DemoAnimation] {
        
        var prezets = [DemoAnimation]()
        let dataAnimation = DataManager.shared.animations
        
        dataAnimation.forEach { (animation) in
            prezets.append(DemoAnimation(animationPrezet: animation,
                                         force: 2,
                                         curves: .easeIn,
                                         duration: 1,
                                         delay: 3 )
            )
        }
        
        return prezets
    }
}
