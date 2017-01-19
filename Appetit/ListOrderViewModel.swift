//
//  ListOrderViewModel.swift
//  Appetit
//
//  Created by Douglas Taquary on 17/01/17.
//  Copyright © 2017 Douglas Taquary. All rights reserved.
//

import Foundation

public protocol ListOrderViewModelProtocol {
    
    var title: NSAttributedString { get }
    var saveButtonText: String { get }
    var cancelButtonText: NSAttributedString { get }
    
    var item: Item { get }
    
    var didTapCancel: () -> Void { get }
    var didTapSave: (Item) -> Void { get }
}

public struct ListOrderViewModel: ListOrderViewModelProtocol {

    public var saveButtonText: String
    public let title: NSAttributedString
    public let cancelButtonText: NSAttributedString
    
    public let item: Item
    
    public let didTapCancel: () -> Void
    public let didTapSave: (Item) -> Void
    
}

extension ListOrderViewModel {
    
    public init()
    {
        let item = Item()
        self.init(item: item,
                  didTapCancel: { _ in print("Cancel")},
                  didTapSave: { _ in print("Save") })
    }
    
    public init(item: Item,
                didTapCancel: @escaping () -> Void,
                didTapSave: @escaping (Item) -> Void)
    {
        let style = Style()
        
        title = NSAttributedString(string: "Meus Pedidos",
                                   font: style.title3,
                                   color: style.textColor)
        
        saveButtonText = "Salvar"
        
        
        cancelButtonText = NSAttributedString(string: "Cancelar",
                                              font: style.subhead,
                                              color: style.textColor)
        
        self.item = Item(id: item.id, name: item.name, price: item.price, isAdd: item.isAdd, thumImage: item.thumImage)
        self.didTapCancel = didTapCancel
        self.didTapSave = didTapSave
    }
}


