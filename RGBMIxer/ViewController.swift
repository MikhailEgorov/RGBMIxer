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
        
        //setupRedSlider
        //redSlider.value = 0.00
        
        redSlider.minimumValue = 0
        redSlider.maximumValue = 1
        
        //setupGreenSlider
        greenSlider.value = 0
        greenSlider.minimumValue = 0
        greenSlider.maximumValue = 1
        
        //setupBlueSlider
        blueSlider.value = 0
        blueSlider.minimumValue = 0
        blueSlider.maximumValue = 1
        
    }

    @IBAction func redSliderAction() {
        
        redValueLabel.text = String(format: "%.2f", redSlider.value)
    }
    
    @IBAction func greenSliderAction() {
        greenValueLabel.text = String(format: "%.2f",greenSlider.value)
    }
    @IBAction func blueSliderAction() {
        blueValueLabel.text = String(format: "%.2f",blueSlider.value)
    }
}

