//
//  DemoAnimationViewController.swift
//  PosysaevSA_HW2.9
//
//  Created by Sergei Posysaev on 10.11.2020.
//

import Spring

class DemoAnimationViewController: UIViewController {
    
    static var nextIndexToButton = 1
    
    var presetsAnimation = DemoAnimation.createModels()
    
    @IBOutlet weak var viewDemoAnimation: SpringButton!
    
    @IBOutlet weak var curveLabel: UILabel!
    @IBOutlet weak var forceLabel: UILabel!
    @IBOutlet weak var durationLabel: UILabel!
    @IBOutlet weak var delayLabel: UILabel!
    @IBOutlet weak var presetLabel: UILabel! {
        didSet {
            presetLabel.text = "preset: \(presetsAnimation.first?.animationPrezet ?? "")"
            curveLabel.text = "curve: \(presetsAnimation.first?.curves.rawValue ?? "")"
            forceLabel.text = "force: \(String(presetsAnimation.first?.force ?? 0))"
            durationLabel.text = "duration: \(String(presetsAnimation.first?.duration ?? 0))"
            delayLabel.text = "delay: \(String(presetsAnimation.first?.delay ?? 0))"
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        viewDemoAnimation.setTitle("next: " + presetsAnimation[DemoAnimationViewController.nextIndexToButton].animationPrezet,
                                   for: .normal)
    }
    
    @IBAction func startAnimationButton(_ sender: SpringButton) {
        
        
        //viewDemoAnimation.animation = ""
        //
        //
        // viewDemoAnimation.animate()
        
        if DemoAnimationViewController.nextIndexToButton < presetsAnimation.count - 1 {
            DemoAnimationViewController.nextIndexToButton += 1
        } else {
            DemoAnimationViewController.nextIndexToButton = 0
        }
        let nextTitle = "next: " + presetsAnimation[DemoAnimationViewController.nextIndexToButton].animationPrezet
        sender.setTitle(nextTitle, for: .normal)
    }
    
}

extension DemoAnimationViewController {
    
    //    func changeBall() {
    //        isBall = !isBall
    //        let animation = CABasicAnimation()
    //        let halfWidth = ballView.frame.width / 2
    //        let cornerRadius: CGFloat = isBall ? halfWidth : 10
    //        animation.keyPath = "cornerRadius"
    //        animation.fromValue = isBall ? 10 : halfWidth
    //        animation.toValue = cornerRadius
    //        animation.duration = 0.2
    //        ballView.layer.cornerRadius = cornerRadius
    //        ballView.layer.add(animation, forKey: "radius")
    //    }
}
