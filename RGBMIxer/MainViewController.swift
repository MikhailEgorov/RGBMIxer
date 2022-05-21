//
//  MainViewController.swift
//  RGBMIxer
//
//  Created by Егоров Михаил on 09.05.2022.
//

import UIKit

protocol SettingsColorsViewControllersDelegate {
    func setNewColors(for currentColorsView: UIColor)
}

class MainViewController: UIViewController {

    override func viewDidLoad() {
        //super.viewDidLoad()

    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let settingsVC = segue.destination as? SettingsColorsViewController else {return}
        settingsVC.delegate = self
        settingsVC.currentColorMainVC = view.backgroundColor
    }
}

extension MainViewController: SettingsColorsViewControllersDelegate {
    func setNewColors(for currentColorsView: UIColor) {
        view.backgroundColor = currentColorsView
    }
   
}
