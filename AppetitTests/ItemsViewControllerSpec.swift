//
//  ItemsViewControllerSpec.swift
//  Appetit
//
//  Created by Sense Infoway on 30/12/16.
//  Copyright © 2016 Douglas Taquary. All rights reserved.
//

import Quick
import Nimble
@testable import Appetit

struct AppetitAPICallMock: AppetitAPICalls {
    let items: [Appetit.Item]
    
    func items(completion: @escaping ([Appetit.Item]?) -> Void) {
        completion(items)
    }
}

class ItemsViewControllerSpec: QuickSpec {
    override func spec() {
        describe("ItemsViewController") {
            
            var controller: ItemsViewController!
            var apiMock: AppetitAPICalls!
            beforeEach {
                let testBundle = Bundle(for: type(of: self))
                let mockLoader = MockLoader(file: "items", in: testBundle)
                let item = (mockLoader?.map(to: Item.self))!
                apiMock = AppetitAPICallMock(items: [item])
                
                controller = Storyboard.Main.itemsViewControllerScene.viewController() as! ItemsViewController
                
                controller.provider = apiMock
                
                //Load view components
                let _ = controller.view
                
                it("should have expected props setup") {
                    controller.viewDidLoad()
                    expect(controller.provider).toNot(beNil())
                    expect(controller.collectionDataSource).toNot(beNil())
                    expect(controller.collectionDelegate).toNot(beNil())
                    expect(controller.items).toNot(beNil())
                    expect(controller.activityIndicator).toNot(beNil())
                    expect(controller.collectionView).toNot(beNil())
                }
                
                it("should use mock response on fetchItems") {
                    controller.viewDidLoad()
                    let count = controller.collectionDataSource?.items.count ?? 0
                    expect(count).toEventually(equal(1))
                }
                
                it("should be able to display content as collectionView") {
                    controller.viewDidLoad()
                    expect(controller.collectionView.isHidden).to(beFalsy())
                }
                
                context("DidSelectedItem") {
                    beforeEach {
                        let navController: UINavigationController = Storyboard.Main
                        .initialViewController()
                        controller = navController.viewControllers.first as! ItemsViewController
                        controller.provider = apiMock
                        let _ = controller.view
                        controller.viewDidLoad()
                    }
                    
                    it("should navigate do next controller when selecting a item") {
                        let indexPath = IndexPath(row: 0, section: 0)
                        let controllerCounts = controller.navigationController?.viewControllers.count
                        expect(controllerCounts).to(equal(1))
                        controller.didSelectedItem(at: indexPath)
                        expect(controller.navigationController?.viewControllers.count ?? 0)
                            .toEventually(equal(2), timeout: 3)
                    }
                }
            }
        }
    }
}
