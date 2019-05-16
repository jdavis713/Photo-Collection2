//
//  ThemeSelectionViewController.swift
//  Photo Collection2
//
//  Created by Jordan Davis on 5/15/19.
//  Copyright © 2019 Jordan Davis. All rights reserved.
//

import UIKit

class ThemeSelectionViewController: UIViewController {
    
    //MARK: -Actions
    
    @IBAction func selectDarkTheme(_ sender: UIButton) {
        themeHelper?.setThemePreferenceToDark()
        dismiss(animated: true, completion: nil)
    }
    
    @IBAction func selectPurpleTheme(_ sender: UIButton) {
        themeHelper?.setThemePreferenceToPurple()
        dismiss(animated: true, completion: nil)
    }
   
    
    //MARK: -Properties
    
    var themeHelper: ThemeHelper?

}
