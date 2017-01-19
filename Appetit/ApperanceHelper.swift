//
//  ApperanceHelper.swift
//  Appetit
//
//  Created by Sense Infoway on 29/12/16.
//  Copyright © 2016 Douglas Taquary. All rights reserved.
//

import Foundation
import UIKit

struct ApperanceProxyHelper {
    
    static func customizeNavigationBar() {
        let navigationBarAppearace = UINavigationBar.appearance()
        navigationBarAppearace.tintColor = ColorPalette.white
        navigationBarAppearace.titleTextAttributes = [NSForegroundColorAttributeName:ColorPalette.white]
    }
    
}
