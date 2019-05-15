//
//  ThemeHelper.swift
//  Photo Collection2
//
//  Created by Jordan Davis on 5/15/19.
//  Copyright © 2019 Jordan Davis. All rights reserved.
//

import Foundation

class ThemeHelper {
    
    init () {
        if themePreference == nil {
            setThemePreferenceToDark()
        }
    }
    
    func setThemePreferenceToDark() {
        let userDefaults = UserDefaults.standard
        userDefaults.set("Dark", forKey: themePreferenceKey)
    }
    
    func setThemePreferenceToPurple() {
        let userDefaults = UserDefaults.standard
        userDefaults.set("Purple", forKey: themePreferenceKey)
    }
    
    
    
    
    
    
    
    
    //MARK: -Properties
    let themePreferenceKey: String = ""
    
    var themePreference: String? {
        let userDefaults = UserDefaults.standard
        let themePreference = userDefaults.string(forKey: themePreferenceKey)
        return themePreference
    }
}
