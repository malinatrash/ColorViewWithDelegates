//
//  ViewController.swift
//  ColorViewWithDelegates
//
//  Created by Pavel Naumov on 12.05.2022.
//

import UIKit

protocol ColorViewViewControllerDelegate: ColorViewViewController {
    func setColor(red: String, green: String, blue: String)
}

class MainViewController: UIViewController {

    @IBOutlet weak var backgroudView: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        backgroudView.backgroundColor = UIColor.init(
            red: CGFloat(0),
            green: CGFloat(1),
            blue: CGFloat(1),
            alpha: 1
        )
        
        
    }


}

//extension MainViewController: ColorViewViewControllerDelegate {
//    func setColor(red: String, green: String, blue: String) {
//
//    }
//}

