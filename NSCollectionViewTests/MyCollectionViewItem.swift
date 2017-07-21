//
//  MyCollectionViewItem.swift
//  NSCollectionViewTests
//
//  Created by Artem Hruzd on 7/21/17.
//  Copyright © 2017 Artem Hruzd. All rights reserved.
//

import Cocoa

class MyCollectionViewItem: NSCollectionViewItem {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do view setup here.
        view.wantsLayer = true
    }
    
    override func preferredLayoutAttributesFitting(_ layoutAttributes: NSCollectionViewLayoutAttributes) -> NSCollectionViewLayoutAttributes {
        print("Method never called, item not self size")
        return layoutAttributes
    }
}
