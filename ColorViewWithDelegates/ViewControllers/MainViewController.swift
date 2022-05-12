//
//  ViewController.swift
//  ColorViewWithDelegates
//
//  Created by Pavel Naumov on 12.05.2022.
//

import UIKit

protocol ColorViewControllerDelegate: ColorViewViewController {
    func changeColorView(red: Float, green: Float, blue: Float)
}

class MainViewController: UIViewController {

    @IBOutlet weak var backgroudView: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
}

extension MainViewController: ColorViewControllerDelegate {
    func changeColorView(red: Float, green: Float, blue: Float) {
        backgroudView.backgroundColor = UIColor.init(
            red: CGFloat(red),
            green: CGFloat(green),
            blue: CGFloat(blue),
            alpha: 1
        )
        
    }
}

