//
//  Animation.swift
//  PosysaevSA_HW2.9
//
//  Created by Sergei Posysaev on 10.11.2020.
//

struct DemoAnimation {
    
    let animationPrezet: String
    let force: Double
    let curves: [String]
    let duration: Double
    let delay: Double
    
}

extension DemoAnimation {
    
    static func createModels() -> [DemoAnimation] {
        
        var prezets = [DemoAnimation]()
        let dataAnimation = DataManager.shared.animations
        let curves = DataManager.shared.curves
        
        dataAnimation.forEach { (animation) in
            prezets.append(DemoAnimation(animationPrezet: animation,
                                         force: 1,
                                         curves: [curves.randomElement() ?? "shake"],
                                         duration: 3,
                                         delay: 0.5 ))
        }
        return prezets        
    }
}
