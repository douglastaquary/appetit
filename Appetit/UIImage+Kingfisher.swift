//
//  UIImage+Kingfisher.swift
//  Appetit
//
//  Created by Douglas Taquary on 19/01/17.
//  Copyright © 2017 Douglas Taquary. All rights reserved.
//

import UIKit
import Kingfisher

extension UIImageView {
    func download(image url: String) {
        guard let imageURL = URL(string:url) else {
            return
        }
        self.kf.setImage(with: ImageResource(downloadURL: imageURL))
    }
}
