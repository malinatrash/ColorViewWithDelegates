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
    
    private var colors: CIColor {
        CIColor(color: view.backgroundColor ?? .white)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let colorViewVC = segue.destination as? ColorViewViewController else { return }
        colorViewVC.colors = colors
        colorViewVC.delegate = self
        }
}

extension MainViewController: ColorViewControllerDelegate {
    func changeColorView(red: UISlider, green: UISlider, blue: UISlider) {
        view.backgroundColor = UIColor.init(
            red: CGFloat(red.value),
            green: CGFloat(green.value),
            blue: CGFloat(blue.value),
            alpha: 1
        )
    }
}

