//
//  DemoAnimationViewController.swift
//  PosysaevSA_HW2.9
//
//  Created by Sergei Posysaev on 10.11.2020.
//

import Spring

class DemoAnimationViewController: UIViewController {
    
    static var nextIndexToButton = 0
    var gradientLayer: CAGradientLayer! {
        didSet {
            gradientLayer.startPoint = CGPoint(x: 0, y: 0)
            gradientLayer.endPoint = CGPoint(x: 1, y: 1)
            gradientLayer.colors = [UIColor.blue.cgColor,
                                    UIColor.yellow.cgColor]
        
        }
    }
    var presetsAnimation = DemoAnimation.createModels()
    
    // MARK: - IBOutlets
    
    @IBOutlet weak var viewSpring: SpringView!
    @IBOutlet weak var btnDemoAnimation: SpringButton!
    @IBOutlet weak var curveLabel: UILabel!
    @IBOutlet weak var forceLabel: UILabel!
    @IBOutlet weak var durationLabel: UILabel!
    @IBOutlet weak var delayLabel: UILabel!
    @IBOutlet weak var presetLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        gradientLayer = CAGradientLayer()
        view.layer.insertSublayer(gradientLayer, at: 0)
        
        updateLabels()
        viewSpring.animate()
        
        btnDemoAnimation.setTitle("next: " + presetsAnimation[DemoAnimationViewController.nextIndexToButton + 1].animationPrezet,
                                  for: .normal)
    }
    
    override func viewDidLayoutSubviews() {
        gradientLayer.frame = CGRect(x: 0,
                                     y: 0,
                                     width: self.view.bounds.size.width,
                                     height: self.view.bounds.size.height)
    }
    
    private func updateLabels() {
        presetLabel.text = " preset: \(presetsAnimation[DemoAnimationViewController.nextIndexToButton].animationPrezet )"
        curveLabel.text = " curve: \(presetsAnimation[DemoAnimationViewController.nextIndexToButton].curves.first ?? "spring")"
        forceLabel.text = " force: \(String(presetsAnimation[DemoAnimationViewController.nextIndexToButton].force ))"
        durationLabel.text = " duration: \(String(presetsAnimation[DemoAnimationViewController.nextIndexToButton].duration ))"
        delayLabel.text = " delay: \(String(presetsAnimation[DemoAnimationViewController.nextIndexToButton].delay ))"
    }
    
    
    
    // MARK: - Action
    
    @IBAction func startAnimationButton(_ sender: SpringButton) {
        
        let currentAnimation = presetsAnimation[DemoAnimationViewController.nextIndexToButton]
        
        updateLabels()
        viewSpring.animation = currentAnimation.animationPrezet
        viewSpring.curve = currentAnimation.curves.first ?? "shake"
        viewSpring.damping = 2.5
        viewSpring.velocity = 1.5
        viewSpring.animate()
        
        if DemoAnimationViewController.nextIndexToButton < presetsAnimation.count - 1 {
            DemoAnimationViewController.nextIndexToButton += 1
        } else {
            DemoAnimationViewController.nextIndexToButton = 0
        }
        
        let nextTitle = "next: " + presetsAnimation[DemoAnimationViewController.nextIndexToButton].animationPrezet
        sender.setTitle(nextTitle, for: .normal)
    }
    
}


