//
//  ViewController.swift
//  RGBMIxer
//
//  Created by Егоров Михаил on 28.03.2022.
//

import UIKit

class SettingsColorsViewController: UIViewController {

    @IBOutlet var screenColors: UIView!
    
    @IBOutlet var redSlider: UISlider!
    @IBOutlet var greenSlider: UISlider!
    @IBOutlet var blueSlider: UISlider!
    
    @IBOutlet var redValueLabel: UILabel!
    @IBOutlet var greenValueLabel: UILabel!
    @IBOutlet var blueValueLabel: UILabel!
    
    @IBOutlet var redValueTextField: UITextField!
    @IBOutlet var greenValueTextField: UITextField!
    @IBOutlet var blueValueTextField: UITextField!
    
    
    var delegate: SettingsColorsViewControllersDelegate!
    var currentColorMainVC: UIColor!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        screenColors.layer.cornerRadius = 10
        
        rgbMixer()
        setScreenColorFromMainVC()
        
        setSlider()
        setValue(for: redValueLabel, greenValueLabel, blueValueLabel)
        setValue(for: redValueTextField, greenValueTextField, blueValueTextField)
      
    }

    @IBAction func redSliderAction() {
        redValueLabel.text = string(from: redSlider)
        redValueTextField.text = string(from: redSlider)
        rgbMixer()
    }
    
    @IBAction func greenSliderAction() {
        greenValueLabel.text = string(from: greenSlider)
        greenValueTextField.text = string(from: greenSlider)
        rgbMixer()
    }
    
    @IBAction func blueSliderAction() {
        blueValueLabel.text = string(from: blueSlider)
        blueValueTextField.text = string(from: blueSlider)
        rgbMixer()
    }
    
    private func rgbMixer () {
        screenColors.backgroundColor = UIColor(
            red: CGFloat(redSlider.value),
            green: CGFloat(greenSlider.value),
            blue: CGFloat(blueSlider.value),
            alpha: 1)
    }
    
    private func setScreenColorFromMainVC () {
        screenColors.backgroundColor = currentColorMainVC
    }
    
    private func string(from slider: UISlider) -> String {
        String(format: "%.2f", slider.value)
    }
    
    private func setValue(for labels: UILabel...) {
        labels.forEach { label in
            switch label {
            case redValueLabel: label.text = string(from: redSlider)
            case greenValueLabel: label.text = string(from: greenSlider)
            default: label.text = string(from: blueSlider)
            }
        }
    }
    
    private func setValue(for textFields: UITextField...) {
        textFields.forEach { textField in
            switch textField {
            case redValueTextField: textField.text = string(from: redSlider)
            case greenValueTextField: textField.text = string(from: greenSlider)
            default: textField.text = string(from: blueSlider)
            }
        }
    }
    
    private func setSlider() {
        let ciColor = CIColor(color: currentColorMainVC)
    
        redSlider.value = Float(ciColor.red)
        greenSlider.value = Float(ciColor.green)
        blueSlider.value = Float(ciColor.blue)
    }
    
    @IBAction func saveColorsViewButtonPressed() {
        guard let currentColorsView = screenColors.backgroundColor else { return }
        delegate.setNewColors(for: currentColorsView)
        dismiss(animated: true)
    }
    
    @objc private func didTapDone() {
        view.endEditing(true)
    }
    
    
}

//MARK: - UITextFieldDelegate
extension SettingsColorsViewController: UITextFieldDelegate {
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesBegan(touches, with: event)
        view.endEditing(true)
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        guard let text = textField.text else { return }
        if let currentValue = Float(text) {
            switch textField {
            case redValueTextField: redSlider.setValue(currentValue, animated: true)
                setValue(for: redValueLabel)
            case greenValueTextField: greenSlider.setValue(currentValue, animated: true)
                setValue(for: greenValueLabel)
            default: blueSlider.setValue(currentValue, animated: true)
                setValue(for: blueValueLabel)
            }
            rgbMixer()
            return
        }
    }
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        let keyboardToolbar = UIToolbar()
        keyboardToolbar.sizeToFit()
        textField.inputAccessoryView = keyboardToolbar
        
        let doneButton = UIBarButtonItem(barButtonSystemItem: .done,
                                         target: self,
                                         action: #selector(didTapDone)
        )
        
        let flexBarButton = UIBarButtonItem(barButtonSystemItem: .flexibleSpace,
                                            target: nil,
                                            action: nil)
        keyboardToolbar.items = [flexBarButton, doneButton]
    }
}

