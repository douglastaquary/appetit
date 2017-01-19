//
//  AppCoordinate.swift
//  Appetit
//
//  Created by Douglas Taquary on 17/01/17.
//  Copyright © 2017 Douglas Taquary. All rights reserved.
//

import UIKit

public class AppCoordinator {
    
    let navigationController: UINavigationController
     var provider: AppetitAPICalls = AppetitAPIManager()
    //let massService: MassService = MassService()
    
    public init(with navigationController: UINavigationController){
        navigationController.isNavigationBarHidden = false
        self.navigationController = navigationController
    }
    
    public func start(){
        let controller = ItemsViewController()
        controller.delegate = self
        navigationController.pushViewController(controller, animated: true)
    }
    
    let modalTransitionController = ModalTransition()
    
    func startListOrders(){
//        let listOrdersViewController = ListOrdersViewController()
//        listOrdersViewController.delegate = self
//        
//        listOrdersViewController.modalPresentationStyle = .custom
//        listOrdersViewController.transitioningDelegate = modalTransitionController
//        
//        self.navigationController.present(listOrdersViewController,
//                                          animated: true,
//                                          completion: nil)
    }
    
    func startDetailItem(at indexPath: IndexPath)
    {
        let detailViewController = ItemViewController()
        //detailViewController.delegate = self
        self.navigationController.pushViewController(detailViewController, animated: true)
    }
}


extension AppCoordinator: ItemsDelegate {
    
    public func didSelectedItem(at index: IndexPath)
    {
        startDetailItem(at: index)
    }
}



extension AppCoordinator {
    

    
}


