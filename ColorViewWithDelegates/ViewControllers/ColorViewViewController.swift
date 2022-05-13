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
    
    @IBOutlet weak var redSliderTF: UITextField!
    @IBOutlet weak var greenSliderTF: UITextField!
    @IBOutlet weak var blueSliderTF: UITextField!
    
    var delegate: ColorViewControllerDelegate!
    var colors: CIColor!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        colorView.layer.cornerRadius = 30
        redSliderTF.delegate = self
        greenSliderTF.delegate = self
        blueSliderTF.delegate = self
        
        navigationItem.hidesBackButton = true
        
        redSlider.value = Float(colors.red)
        greenSlider.value = Float(colors.green)
        blueSlider.value = Float(colors.blue)
        
        changeColorView()
        writeValue(value: redSlider.value, valueLabel: redColorValueLabel, valueTF: redSliderTF)
        writeValue(value: greenSlider.value, valueLabel: greenColorValueLabel, valueTF: greenSliderTF)
        writeValue(value: blueSlider.value, valueLabel: blueColorValueLabel, valueTF: blueSliderTF)
    }
    
    @IBAction func changeRedSliderValue() {
        changeColorView()
        writeValue(value: redSlider.value, valueLabel: redColorValueLabel, valueTF: redSliderTF)
    }
    
    @IBAction func changeGreenSliderValue() {
        changeColorView()
        writeValue(value: greenSlider.value, valueLabel: greenColorValueLabel, valueTF: greenSliderTF)
    }
    
    @IBAction func changeBlueSliderValue() {
        changeColorView()
        writeValue(value: blueSlider.value, valueLabel: blueColorValueLabel, valueTF: blueSliderTF)
    }
    
    @IBAction func doneButtonPressed() {
        view.endEditing(true)
        delegate.changeColorView(red: redSlider, green: greenSlider, blue: blueSlider)
        dismiss(animated: true)
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
    private func writeValue(value: Float, valueLabel: UILabel, valueTF: UITextField) {
        valueLabel.text = String(value)
        valueLabel.text = String(round(100 * value) / 100)
        valueTF.text = valueLabel.text
    }
}

extension ColorViewViewController: UITextFieldDelegate {
    func textFieldDidEndEditing(_ textField: UITextField) {
        if textField == redSliderTF {
            redSlider.value = Float(textField.text!) ?? 0
            redColorValueLabel.text = textField.text
            changeColorView()
        } else if textField == greenSliderTF {
            greenSlider.value = Float(textField.text!) ?? 0
            greenColorValueLabel.text = textField.text
            changeColorView()
        } else {
            blueSlider.value = Float(textField.text!) ?? 0
            blueColorValueLabel.text = textField.text
            changeColorView()
        }
    }
}
