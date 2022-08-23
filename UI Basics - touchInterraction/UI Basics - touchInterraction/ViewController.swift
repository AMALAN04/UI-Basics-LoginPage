//
//  ViewController.swift
//  UI Basics - touchInterraction
//
//  Created by amalan-pt5585 on 23/08/22.
//

import UIKit

class ViewController: UIViewController {
    let button1: UIButton = UIButton()
    let multipleTouchButton: UIButton = UIButton()
    let exclusiveTouchButton: UIButton = UIButton()
    let stackView: UIStackView = UIStackView()
    var flipFlag1 = true
    var flipFlag2 = true
    var flipFlag3 = true

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .gray
        framesVsBonds()
//        style()
//        layout()
        // Do any additional setup after loading the view.
    }


}

extension ViewController {
    func style() {
        button1.isUserInteractionEnabled = false
        button1.translatesAutoresizingMaskIntoConstraints = false
        button1.setTitle("Button1", for: .normal)
        button1.layer.cornerRadius = 25
        button1.backgroundColor = .systemBlue
        button1.addTarget(self, action: #selector(button1Pressed), for: .touchUpInside)
        
        
        multipleTouchButton.isMultipleTouchEnabled = true
        multipleTouchButton.translatesAutoresizingMaskIntoConstraints = false
        multipleTouchButton.setTitle("multipleTouchButton", for: .normal)
        multipleTouchButton.layer.cornerRadius = 25
        multipleTouchButton.backgroundColor = .systemBlue
        multipleTouchButton.addTarget(self, action: #selector(multipleTouchButtonPressed), for: .touchUpInside)
        
        exclusiveTouchButton.isExclusiveTouch = true
        exclusiveTouchButton.translatesAutoresizingMaskIntoConstraints = false
        exclusiveTouchButton.setTitle("exclusiveTouchButton", for: .normal)
        exclusiveTouchButton.layer.cornerRadius = 25
        exclusiveTouchButton.backgroundColor = .systemBlue
        exclusiveTouchButton.addTarget(self, action: #selector(exclusiveTouchButtonPressed), for: .touchUpInside)
        
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .vertical
        stackView.spacing = 2
    }
    
    @objc func button1Pressed() {
        flipFlag1 = !flipFlag1
        if flipFlag1 {
            button1.backgroundColor = .systemBlue
        } else {
        button1.backgroundColor = .systemOrange
        }
    }
    
    @objc func multipleTouchButtonPressed() {
        button1.isUserInteractionEnabled =  !button1.isUserInteractionEnabled
        flipFlag2 = !flipFlag2
        if flipFlag2 {
            multipleTouchButton.backgroundColor = .systemBlue
        } else {
        multipleTouchButton.backgroundColor = .systemOrange
        }
        
    }
    
    @objc func exclusiveTouchButtonPressed() {
        exclusiveTouchButton.backgroundColor = .systemOrange
//        flipFlag3 = !flipFlag3
//        if flipFlag1 {
//            exclusiveTouchButton.backgroundColor = .systemBlue
//        } else {
//        exclusiveTouchButton.backgroundColor = .systemOrange
//        }
    }
    
    func layout() {
        view.addSubview(stackView)
        
        stackView.addArrangedSubview(button1)
        stackView.addArrangedSubview(multipleTouchButton)
        stackView.addArrangedSubview(exclusiveTouchButton)
        
        let constrain = [
        stackView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
        stackView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
        stackView.leadingAnchor.constraint(equalToSystemSpacingAfter: view.safeAreaLayoutGuide.leadingAnchor, multiplier: 4),
        view.safeAreaLayoutGuide.trailingAnchor.constraint(equalToSystemSpacingAfter: stackView.trailingAnchor, multiplier: 4)
        ]
        NSLayoutConstraint.activate(constrain)
    }
}

extension ViewController {
    func framesVsBonds() {
        
        let rectangleView: UIView = UIView()
        let rectangleBond: UIView = UIView()
        
        view.addSubview(rectangleView)
        view.addSubview(rectangleBond)
        rectangleView.backgroundColor = .systemBlue
        rectangleView.frame = CGRect(x: 100, y: 100, width: 100, height: 100)
        rectangleView.transform = CGAffineTransform(rotationAngle: 90)
        print(rectangleView.frame)
        print(rectangleView.bounds)
        

//        rectangleBond.backgroundColor = .systemOrange
//        rectangleBond.bounds = CGRect(x: 100, y: 100, width: 100, height: 100)
//        rectangleBond.transform = CGAffineTransform(rotationAngle: 90)
//        print(rectangleBond.bounds)
//        rectangleBond. = CGPoint(x: 200, y: 200)
    }
}
