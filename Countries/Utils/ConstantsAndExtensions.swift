//
//  ConstantsAndExtensions.swift
//  Countries
//
//  Created by Mac OSX on 5/17/18.
//  Copyright © 2018 Mac OSX. All rights reserved.
//

import UIKit

// Constants
let userDefaults = UserDefaults.standard

// Extensions

extension UIView {
    func roundCorners(cornerRadius: Double) {
        self.layer.cornerRadius = CGFloat(cornerRadius)
        self.clipsToBounds = true
        self.layer.maskedCorners = [.layerMinXMinYCorner, .layerMaxXMinYCorner]
    }
}

