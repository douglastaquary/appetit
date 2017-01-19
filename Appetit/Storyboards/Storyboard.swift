//
//  Storyboard.swift
//  Appetit
//
//  Created by Sense Infoway on 29/12/16.
//  Copyright © 2016 Douglas Taquary. All rights reserved.
//

import Foundation
import UIKit

protocol StoryboardSceneType {
    static var storyboardName: String { get }
}

extension StoryboardSceneType {
    static func storyboard() -> UIStoryboard {
        return UIStoryboard(name: self.storyboardName, bundle: nil)
    }
    
    static func initialViewController() -> UIViewController {
        guard let vc = storyboard().instantiateInitialViewController() else {
            fatalError("\nFailed to instantiate initialViewControlller for \(self.storyboardName)")
        }
        return vc
    }
}

extension StoryboardSceneType where Self: RawRepresentable, Self.RawValue == String {
    func viewController() -> UIViewController {
        return Self.storyboard().instantiateViewController(withIdentifier: self.rawValue)
    }
    static func viewController(identifier: Self) -> UIViewController {
        return identifier.viewController()
    }
}

protocol StoryboardSegueType: RawRepresentable { }

extension UIViewController {
    func performSegue<S: StoryboardSegueType>(segue: S, sender: AnyObject? = nil) where S.RawValue == String {
        performSegue(withIdentifier: segue.rawValue, sender: sender)
    }
}

struct Storyboard {
    enum LaunchScreen: StoryboardSceneType {
        static let storyboardName = "LaunchScreen"
    }
    enum Main: String, StoryboardSceneType {
        static let storyboardName = "Main"
        
        static func initialViewController() -> UINavigationController {
            guard let vc = storyboard().instantiateInitialViewController() as? UINavigationController else {
                fatalError("Failed to instantiate initialViewController for \(self.storyboardName)")
            }
            return vc
        }
        
        case itemsViewControllerScene = "ItemsViewController"
        static func instantiateCharacterViewController() -> ItemsViewController {
            guard let vc = Storyboard.Main.itemsViewControllerScene.viewController() as? ItemsViewController
                else {
                    fatalError("ViewController 'ItemsViewController' is not of the expected class ItemsViewController.")
            }
            return vc
        }
        
        case itemViewControllerScene = "ItemViewController"
        static func instantiateCharactersViewController() -> ItemViewController {
            guard let vc = Storyboard.Main.itemViewControllerScene.viewController() as? ItemViewController
                else {
                    fatalError("ViewController 'ItemViewController' is not of the expected class ItemViewController.")
            }
            return vc
        }
    }
}

