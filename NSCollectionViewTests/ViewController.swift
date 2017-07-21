//
//  ViewController.swift
//  NSCollectionViewTests
//
//  Created by Artem Hruzd on 7/21/17.
//  Copyright © 2017 Artem Hruzd. All rights reserved.
//

import Cocoa

class ViewController: NSViewController {
    @IBOutlet weak var myCollectionView: NSCollectionView!

    var myData = ["1", "2"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let cvl = myCollectionView.collectionViewLayout as? NSCollectionViewFlowLayout {
            cvl.estimatedItemSize = CGSize(width: 150, height: 75)
        }

        // Do any additional setup after loading the view.
    }

    override var representedObject: Any? {
        didSet {
        // Update the view, if already loaded.
        }
    }

    func randomString(length: Int) -> String {
        
        let letters : NSString = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789"
        let len = UInt32(letters.length)
        
        var randomString = ""
        
        for _ in 0 ..< length {
            let rand = arc4random_uniform(len)
            var nextChar = letters.character(at: Int(rand))
            randomString += NSString(characters: &nextChar, length: 1) as String
        }
        
        return randomString
    }

}


extension ViewController: NSCollectionViewDataSource {
    func numberOfSections(in collectionView: NSCollectionView) -> Int {
        return myData.count
    }
    
    func collectionView(_ collectionView: NSCollectionView, numberOfItemsInSection section: Int) -> Int {
        return 1
    }
    
    func collectionView(_ itemForRepresentedObjectAtcollectionView: NSCollectionView, itemForRepresentedObjectAt indexPath: IndexPath) -> NSCollectionViewItem {
        
        let item = myCollectionView.makeItem(withIdentifier: "MyCollectionViewItem", for: indexPath)
        guard let collectionViewItem = item as? MyCollectionViewItem else {return item}
        collectionViewItem.textField?.stringValue = "\(indexPath) - \(randomString(length: Int(arc4random_uniform(1000))))"
        
        return collectionViewItem
    }
}

//extension ViewController : NSCollectionViewDelegateFlowLayout {
//    
//    func collectionView(_ collectionView: NSCollectionView,layout collectionViewLayout: NSCollectionViewLayout,sizeForItemAt indexPath: IndexPath) -> NSSize {
//        return NSSize(width: self.myCollectionView.bounds.width, height: 180)
//    }
//}

