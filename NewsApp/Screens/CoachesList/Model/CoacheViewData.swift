//
//  CoacheViewData.swift
//  NewsApp
//
//  Created by Mohannad on 2/5/22.
//
import Foundation
struct CoacheViewData {
    var name : String
    var description : String
    var summery : String
    var img : String
    var id :String
    
    init(data : CoachesSearchItem) {
        self.name = data.name
        self.description = data.description
        self.summery = data.overview
        self.img = data.urlToImage
        self.id = UUID().uuidString
    }
    
    init(stored : Coach) {
        self.name = stored.title
        self.description = stored.description
        self.summery = stored.description
        self.img = stored.img
        self.id = stored.id
    }
}
