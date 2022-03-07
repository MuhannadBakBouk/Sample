//
//  x.swift
//  NewsApp
//
//  Created by Mohannad on 3/6/22.
//

import UIKit

extension UIImageView {
    func setImage(_ name : String) {
        if let img = UIImage(named: name) {
            self.image = img
        }
    }
}
