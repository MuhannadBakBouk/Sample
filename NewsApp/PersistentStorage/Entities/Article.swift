//
//  Article.swift
//  NewsApp
//
//  Created by Mohannad on 2/7/22.
//

import RealmSwift
class Coach :  Object {
    @objc dynamic var title : String = ""
    @objc dynamic var content : String = ""
    @objc dynamic var summery : String = ""
    @objc dynamic var publication : String = ""
    @objc dynamic var img : String = ""
    @objc dynamic var id : String = ""
    override class func primaryKey() -> String{
        return "id"
    }
}

extension Coach {
    convenience init(data : CoacheViewData) {
        self.init()
        self.title = data.name
        self.content = data.description
        self.summery = data.summery
        self.publication = ""
        self.img = data.img
        self.id = data.id
    }
}
