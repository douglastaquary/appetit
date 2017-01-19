//
//  TintButton.swift
//  Appetit
//
//  Created by Douglas Taquary on 16/01/17.
//  Copyright © 2017 Douglas Taquary. All rights reserved.
//


import UIKit

public class TintButton: UIButton {
    
    override public required init(frame: CGRect)
    {
        self.style = Style()
        self.title = ""
        
        super.init(frame: frame)
        
        setBackgroundImage(UIImage.image(with: style.tintColor),
                           for: .normal)
        layer.cornerRadius = style.grid / 2
        layer.masksToBounds = true
        let padding = style.grid * 2
        contentEdgeInsets = UIEdgeInsetsMake(padding, padding, padding, padding)
    }
    
    @available(*, unavailable)
    public required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    let style: StyleProvider
    
    public var title: String {
        didSet {
            let attributedString = NSAttributedString(string: title,
                                                      font: style.title3,
                                                      color: style.textInTintColor)
            
            setAttributedTitle(attributedString,
                               for: .normal)
        }
    }
    
}
