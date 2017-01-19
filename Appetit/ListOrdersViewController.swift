//
//  ListOrdersViewController.swift
//  Appetit
//
//  Created by Douglas Taquary on 17/01/17.
//  Copyright © 2017 Douglas Taquary. All rights reserved.
//

import UIKit

public protocol ListOrdersViewControllerDelegate {
    func didEnd(on viewController: ListOrdersViewController)
}

public class ListOrdersViewController: UIViewController {
    
    let item: Item
    
    let modalTransitionController = ModalTransition()
    
    public required init(with item: Item)
    {
        self.item = item
        super.init(nibName: nil, bundle: nil)
    }
    
    @available(*, unavailable)
    public required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    public var delegate: ListOrdersViewControllerDelegate?
    
    var theView: ListOrder {
        // I don't like this `!` but it's a framework limitation
        return self.view as! ListOrder
    }
    
    override public func loadView()
    {
        // To avoid warnings of autolayout while the view
        // is not resized by the system
        let frame = UIScreen.main.bounds
        let view = ListOrder(frame: frame)
        self.view = view
    }
    
    override public func viewWillAppear(_ animated: Bool)
    {
        super.viewDidAppear(animated)
        
        let viewModel =
            ListOrderViewModel(item: item,
                         didTapCancel: { [weak self] in self?.didEnd() },
                         didTapSave: { [weak self] mass in self?.saveOrder()})
        
        theView.viewModel = viewModel
    }
    
    override public func viewDidLayoutSubviews()
    {
        theView.topOffset = topLayoutGuide.length
    }
    
    func saveOrder() {}
    
    func didEnd() {
        self.dismiss(animated: true, completion: nil)
    }
}

extension ListOrderViewModel: ListOrdersViewControllerDelegate {
    public func didEnd(on viewController: ListOrdersViewController) {
        
    }
}

