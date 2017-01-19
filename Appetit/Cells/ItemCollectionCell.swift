//
//  ItemCollectionCell.swift
//  Appetit
//
//  Created by Sense Infoway on 28/12/16.
//  Copyright © 2016 Douglas Taquary. All rights reserved.
//

import UIKit
import Reusable

final class ItemCollectionCell: UICollectionViewCell, NibReusable {
    
    @IBOutlet weak var name: UILabel!
    @IBOutlet weak var price: UILabel!
    @IBOutlet weak var imageBackground: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        configure()
    }
    
    static func size(for parentWidth: CGFloat) -> CGSize {
        let numberOfCells = CGFloat(2)
        let width = parentWidth / numberOfCells
        return CGSize(width: width, height: width)
    }
    
    func setup(item: Item) {
        name.text = item.name
        price.text = "R$ \(item.price)"
        imageBackground.download(image: item.thumImage?.fullPath() ?? "")   
    }
    
    func configure() {
        imageBackground.layer.cornerRadius = 5
    }
}
