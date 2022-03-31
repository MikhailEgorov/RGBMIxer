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
        
    }
    private func rgbMixer () {
        screenColors.backgroundColor = UIColor(red: CGFloat(redSlider.value), green: CGFloat(greenSlider.value), blue: CGFloat(blueSlider.value), alpha: 1)
    }

    @IBAction func redSliderAction() {
        
        redValueLabel.text = String(format: "%.2f", redSlider.value)
        rgbMixer()
    }
    
    @IBAction func greenSliderAction() {
        greenValueLabel.text = String(format: "%.2f",greenSlider.value)
        rgbMixer()
    }
    @IBAction func blueSliderAction() {
        blueValueLabel.text = String(format: "%.2f",blueSlider.value)
        rgbMixer()
    }
}

