//
//  ClassCell.swift
//  NewsApp
//
//  Created by Mohannad on 3/6/22.
//

import Foundation


import UIKit
import Kingfisher

class ClassCell : UITableViewCell {
    
    var titleLabel : UILabel = {
        let lab = UILabel()
        lab.text = "Class Cell"
        lab.textColor = .black
        lab.font = UIFont.boldSystemFont(ofSize: 16)
        return lab
    }()
    
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        configureUI()
        configureConstraints()
        
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        fatalError()
    }
    

    func configureUI(){
        contentView.addSubview(titleLabel)
        
    }
    
    func configureConstraints(){
        titleLabel.snp.makeConstraints { maker in
            maker.top.leading.equalTo(contentView).offset(4)
            maker.trailing.bottom.equalTo(contentView).offset(-4)
        }
        
      
    }
}



