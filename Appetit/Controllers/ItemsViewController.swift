//
//  ItemsViewController.swift
//  Appetit
//
//  Created by Sense Infoway on 28/12/16.
//  Copyright © 2016 Douglas Taquary. All rights reserved.
//

import UIKit

protocol ItemsDelegate {
    func didSelectedItem(at index: IndexPath)
}

final class ItemsViewController: UIViewController {
    
    var provider: AppetitAPICalls = AppetitAPIManager()
    
    var collectionDataSource: ItemCollectionDataSource?
    var collectionDelegate: ItemCollectionDelegate?
    
    var items: [Item] = []
    
    let style = Style()
    
    public var delegate: ItemsDelegate?
    
    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
}

extension ItemsViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "Appetit"
        
        fetchItems()
    }
}

extension ItemsViewController {
    func fetchItems(){
        collectionView.isHidden = true
        activityIndicator.startAnimating()
        provider.items { items in
            self.activityIndicator.stopAnimating()
            self.activityIndicator.isHidden = true
            if let items = items {
                self.setupCollectionView(with: items)
            }
        }
    }
    
    func setupCollectionView(with items: [Item]) {
        self.items = items
        collectionView.isHidden = false
        collectionDelegate = ItemCollectionDelegate(self)
        collectionDataSource = ItemCollectionDataSource(items: items, collectionView: self.collectionView, delegate: collectionDelegate!)
        
    }
}

extension ItemsViewController: ItemsDelegate {
    func didSelectedItem(at index: IndexPath) {
        guard let nextController = Storyboard.Main.itemViewControllerScene
            .viewController() as? ItemViewController else {
                return
        }
        
        let item = items[index.row]
        nextController.item = item
        self.navigationController?.pushViewController(nextController, animated: true)
    }
}
