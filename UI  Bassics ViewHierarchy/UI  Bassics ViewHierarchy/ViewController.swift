//
//  ViewController.swift
//  UI  Bassics ViewHierarchy
//
//  Created by amalan-pt5585 on 23/08/22.
//

import UIKit

class ViewController: UIViewController {
    let button1: UIButton = UIButton()
    
    let button2: UIButton = UIButton()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        view.backgroundColor = .gray
        style()
        layout()
    }
    
    
}

extension ViewController {
    func style() {
        button1.translatesAutoresizingMaskIntoConstraints = false
        button1.layer.cornerRadius = 25
        button1.backgroundColor = .systemBlue
        button1.isOpaque = true
        button1.addTarget(self, action: #selector(button1Pressed), for: .touchUpInside)
        
        button2.translatesAutoresizingMaskIntoConstraints = false
        button2.layer.cornerRadius = 25
        button2.backgroundColor = .systemOrange
        button2.isOpaque = true
        button2.addTarget(self, action: #selector(button2Pressed), for: .touchUpInside)
    }
    
    @objc func button1Pressed() {
        print("button1Pressed")
//        button1.removeFromSuperview()
//        button1.bringSubviewToFront(button2)
        self.view.sendSubviewToBack( button2)
       // button1.sendSubviewToBack(button2)
    }
    
    @objc func button2Pressed() {
        print("button2Pressed")
        button2.superview?.sendSubviewToBack(button1)
        button2.removeFromSuperview()
        
    }
    func layout() {
        
        view.addSubview(button1)
        button1.addSubview(button2)
        
        let constrains = [
            button2.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            button2.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            button2.widthAnchor.constraint(equalToConstant: 150),
            button2.heightAnchor.constraint(equalToConstant: 40),
            
            button1.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            button1.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            button1.widthAnchor.constraint(equalToConstant: 150),
            button1.heightAnchor.constraint(equalToConstant: 140)
            
            //        button2.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            //        button2.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            //        button2.widthAnchor.constraint(equalToConstant: 150),
            //        button2.heightAnchor.constraint(equalToConstant: 40),
        ]
        NSLayoutConstraint.activate(constrains)
    }
}
