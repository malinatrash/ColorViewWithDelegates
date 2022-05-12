//
//  ColorViewViewController.swift
//  ColorViewWithDelegates
//
//  Created by Pavel Naumov on 12.05.2022.
//

import UIKit

class ColorViewViewController: UIViewController {

    @IBOutlet weak var colorView: UIView!
    
    @IBOutlet weak var redColorValueLabel: UILabel!
    @IBOutlet weak var greenColorValueLabel: UILabel!
    @IBOutlet weak var blueColorValueLabel: UILabel!
    
    @IBOutlet weak var redSlider: UISlider!
    @IBOutlet weak var greenSlider: UISlider!
    @IBOutlet weak var blueSlider: UISlider!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        navigationItem.hidesBackButton = true
        
        colorView.layer.cornerRadius = 25
        colorView.backgroundColor = UIColor.init(
            red: CGFloat(redSlider.value),
            green: CGFloat(greenSlider.value),
            blue: CGFloat(blueSlider.value),
            alpha: 1
        )
        
        redColorValueLabel.text = String(redSlider.value)
        greenColorValueLabel.text = String(greenSlider.value)
        blueColorValueLabel.text = String(blueSlider.value)
    }
    
    
    @IBAction func changeRedSliderValue() {
        changeColorView()
        writeValue(value: redSlider.value, valueLabel: redColorValueLabel)
    }
    
    @IBAction func changeGreenSliderValue() {
        changeColorView()
        writeValue(value: greenSlider.value, valueLabel: greenColorValueLabel)
    }
    
    @IBAction func changeBlueSliderValue() {
        changeColorView()
        writeValue(value: blueSlider.value, valueLabel: blueColorValueLabel)
    }
}

extension ColorViewViewController {
    private func changeColorView() {
        colorView.backgroundColor = UIColor.init(
            red: CGFloat(redSlider.value),
            green: CGFloat(greenSlider.value),
            blue: CGFloat(blueSlider.value),
            alpha: 1
        )
    }
    private func writeValue(value: Float, valueLabel: UILabel) {
        valueLabel.text = String(value)
        valueLabel.text = String(round(100 * value) / 100)
    }
}
