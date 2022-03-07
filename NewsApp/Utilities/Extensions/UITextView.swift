//
//  xx.swift
//  NewsApp
//
//  Created by Mohannad on 3/6/22.
//

import UIKit

extension UITextView{
    func noneEditable(){
        self.isSelectable = false
        self.isEditable = false
    }
    
    func noneScrollable(){
        self.isScrollEnabled = false
        self.showsVerticalScrollIndicator = false
        self.showsHorizontalScrollIndicator = false
    }
}
