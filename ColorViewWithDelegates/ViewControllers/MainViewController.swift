//
//  ViewController.swift
//  ColorViewWithDelegates
//
//  Created by Pavel Naumov on 12.05.2022.
//

import UIKit

protocol ColorViewControllerDelegate {
    func changeColorView(red: UISlider, green: UISlider, blue: UISlider)
}

class MainViewController: UIViewController {

    @IBOutlet weak var backgroudView: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        backgroudView.backgroundColor = UIColor.init(
            red: CGFloat(1),
            green: CGFloat(1),
            blue: CGFloat(1),
            alpha: 1
        )
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let colorViewVC = segue.destination as? ColorViewViewController else { return }
        colorViewVC.delegate = self
        }
}

extension MainViewController: ColorViewControllerDelegate {
    func changeColorView(red: UISlider, green: UISlider, blue: UISlider) {
        backgroudView.backgroundColor = UIColor.init(
            red: CGFloat(red.value),
            green: CGFloat(green.value),
            blue: CGFloat(blue.value),
            alpha: 1
        )
    }
}

