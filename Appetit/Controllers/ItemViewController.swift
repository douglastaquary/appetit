//
//  ItemViewController.swift
//  Appetit
//
//  Created by Sense Infoway on 29/12/16.
//  Copyright © 2016 Douglas Taquary. All rights reserved.
//

import UIKit

public protocol ItemViewControllerDelegate {
    func didPressedAddButton()
}

public class  ItemViewController: UIViewController {
    
    @IBOutlet weak var imageItem: UIImageView!
    @IBOutlet weak var name: UILabel!
    @IBOutlet weak var price: UILabel!
    @IBOutlet weak var addButton: UIButton!
    @IBOutlet weak var qntItemLabel: UILabel!
    
    @IBOutlet weak var downButton: UIButton!
    @IBOutlet weak var upButton: UIButton!
    
    
    let modalTransitionController = ModalTransition()
    
    let style = Style()
    
    var item: Item?
    
    var value: Int = 0
    
    public var delegate: ItemViewControllerDelegate?
}

extension ItemViewController {
    override public func viewDidLoad() {
        super.viewDidLoad()
        
        addButton.addTarget(self,
                            action: #selector(ItemViewController.tapAddItem),
                            for: .touchUpInside)
        
        
        downButton.addTarget(self,
                             action: #selector(ItemViewController.down),
                             for: .touchUpInside)
        
        
        upButton.addTarget(self,
                       action: #selector(ItemViewController.up),
                       for: .touchUpInside)
        
        qntItemLabel.attributedText = NSAttributedString(string: "\(value)",
                                                        font: style.title3,
                                                        color: style.textColor)
        
        setupView()
    }
    
    override public func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationItem.title = item?.name ?? ""
    }
}


extension ItemViewController {
    func setupView() {
        let nameDescription = item?.name ?? ""
        name.attributedText = NSAttributedString(string: nameDescription,
                                                  font: style.title2,
                                                  color: style.textColor)

        let priveValue = item?.price ?? ""
        price.attributedText = NSAttributedString(string: "R$ \(priveValue)",
                                                  font: style.title3,
                                                  color: style.textColor)
        imageItem.download(image: item?.thumImage?.fullPath() ?? "")

    }
    
    func tapAddItem() {
        let listOrdersViewController = ListOrdersViewController(with: item!)
        //listOrdersViewController.delegate = self
        
        listOrdersViewController.modalPresentationStyle = .custom
        listOrdersViewController.transitioningDelegate = modalTransitionController
        
        self.navigationController?.present(listOrdersViewController,
                                           animated: true,
                                           completion: nil)
    }
    
    func down(){
        value = value - 1
        if value <= 0 {
            value = 0
        }
        qntItemLabel.text = "\(value)"
    }
    
    func up(){
        value = value + 1
        qntItemLabel.text = "\(value)"
    }
}


