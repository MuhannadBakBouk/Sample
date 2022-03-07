//
//  TablViewModel.swift
//  NewsApp
//
//  Created by Mohannad on 3/6/22.
//

import Foundation

class TabViewData {
    
    var name : String
    var isActive : Bool
    
    init(name : String , active : Bool = false) {
        self.name = name
        self.isActive = active
    }
}
