//
//  Item.swift
//  Appetit
//
//  Created by Sense Infoway on 28/12/16.
//  Copyright © 2016 Douglas Taquary. All rights reserved.
//

import Foundation
import ObjectMapper

public struct Item {
    public var id: Int = 0
    public var name: String = ""
    public var price: String = ""
    public var isAdd: Bool = false
    var thumImage: ThumbImage?
    //var description: String = ""
}

extension Item: Mappable {
    public init?(map: Map) {
        
    }
    
    mutating public func mapping(map: Map) {
        id <- map["id"]
        name <- map["name"]
        isAdd <- map["isAdd"]
        price <- map["price"]
        thumImage <- map["image"]
        //description <- map["description"]
    }
}


