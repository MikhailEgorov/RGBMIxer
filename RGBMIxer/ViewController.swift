//
//  ViewController.swift
//  RGBMIxer
//
//  Created by Егоров Михаил on 28.03.2022.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet var screenColors: UIView!
    
    @IBOutlet var redSlider: UISlider!
    @IBOutlet var greenSlider: UISlider!
    @IBOutlet var blueSlider: UISlider!
    
    @IBOutlet var redValueLabel: UILabel!
    @IBOutlet var greenValueLabel: UILabel!
    @IBOutlet var blueValueLabel: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        screenColors.layer.cornerRadius = 10
        rgbMixer()
    }

    @IBAction func redSliderAction() {
        
        redValueLabel.text = string(from: redSlider)
        rgbMixer()
    }
    
    @IBAction func greenSliderAction() {
        greenValueLabel.text = string(from: greenSlider)
        rgbMixer()
    }
    
    @IBAction func blueSliderAction() {
        blueValueLabel.text = string(from: blueSlider)
        rgbMixer()
    }
    
    private func rgbMixer () {
        screenColors.backgroundColor = UIColor(
            red: CGFloat(redSlider.value),
            green: CGFloat(greenSlider.value),
            blue: CGFloat(blueSlider.value),
            alpha: 1)
    }
    
    private func string(from slider: UISlider) -> String {
        String(format: "%.2f", slider.value)
    }
}

