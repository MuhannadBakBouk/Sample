//
//  x.swift
//  NewsApp
//
//  Created by Mohannad on 3/6/22.
//

import Foundation
import UIKit

extension UIButton {
    func textColor(_ color : UIColor) {
        self.setTitleColor(color, for: .normal)
    }
    
    func text(_ value : String) {
        self.setTitle(value , for: .normal)
    }
}
