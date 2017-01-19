//
//  ThumbImage.swift
//  Appetit
//
//  Created by Douglas Taquary on 19/01/17.
//  Copyright © 2017 Douglas Taquary. All rights reserved.
//

import Foundation
import ObjectMapper


struct ThumbImage {
    var path: String = ""
    
    func fullPath() -> String {
        return "\(path)"
    }
}

extension ThumbImage: Mappable {
    init?(map: Map) {
        
    }
    
    mutating func mapping(map: Map) {
        path    <- map["path"]
    }
}
