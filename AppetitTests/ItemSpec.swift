//
//  ItemSpec.swift
//  Appetit
//
//  Created by Sense Infoway on 30/12/16.
//  Copyright © 2016 Douglas Taquary. All rights reserved.
//

import Foundation
import Quick
import Nimble
@testable import Appetit

class ItemSpec: QuickSpec {
    override func spec() {
        describe("a item") {
            
            var item: Appetit.Item!
            
            beforeEach {
                let testBundle = Bundle(for: type(of: self))
                let mockLoader = MockLoader(file: "item", in: testBundle)
                item = mockLoader?.map(to: Item.self)
            }
            
            it("should be able to create a Item from json") {
                expect(item).toNot(beNil())
            }
        }
    }
}
