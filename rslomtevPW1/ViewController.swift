//
//  ViewController.swift
//  rslomtevPW1
//
//  Created by Роман Ломтев on 13.09.2022.
//

import UIKit

class ViewController: UIViewController {
    
    private enum Constants {
        static let minColorValue: CGFloat = 0
        static let maxColorValue: CGFloat = 1
        static let alpha: CGFloat = 1
        
        static let animationDuration: CGFloat = 2
        
        static let minCornerRadiusValue: CGFloat = 0
        static let maxCornerRadiusValue: CGFloat = 20
    }

    @IBOutlet var views: [UIView]!
    @IBOutlet weak var button: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        initViews()
    }

    @IBAction func changeColorButtonPressed(_ sender: Any) {
        setRandomColorAndCornerRadius()
    }
    
    private func initViews() {
        setRandomCornerRadius()
    }
    
    private func setRandomColorAndCornerRadius() {
        self.button.isEnabled = false
        
        var colorSet = Set<UIColor>()
        
        while (colorSet.count < views.count) {
            colorSet.insert(UIColor(
                red: .random(in: Constants.minColorValue...Constants.maxColorValue),
                green: .random(in: Constants.minColorValue...Constants.maxColorValue),
                blue: .random(in: Constants.minColorValue...Constants.maxColorValue),
                alpha: Constants.alpha
            ))
        }
        
        UIView.animate(withDuration: Constants.animationDuration, animations: {
            for view in self.views {
                view.layer.cornerRadius = .random(in: Constants.minCornerRadiusValue...Constants.maxCornerRadiusValue)
                view.backgroundColor = colorSet.popFirst()
            }
        }) { completion in
            self.button.isEnabled = true
        }
    }
    
    private func setRandomCornerRadius() {
        for view in views {
            view.layer.cornerRadius = .random(in: Constants.minCornerRadiusValue...Constants.maxCornerRadiusValue)
        }
    }
}

