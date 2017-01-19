//
//  FiristSpec.swift
//  Appetit
//
//  Created by Sense Infoway on 30/12/16.
//  Copyright © 2016 Douglas Taquary. All rights reserved.
//

import Foundation
import Nimble
import Quick
@testable import Appetit

class FiristSpec: QuickSpec {
    override func spec() {
        describe("Firist Simple Spec") {
            
            it("should be true"){
                expect(true).to(beTruthy())
            }
        }
    }
}
