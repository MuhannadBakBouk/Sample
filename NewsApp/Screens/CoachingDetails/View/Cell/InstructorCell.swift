//
//  InstructorCell.swift
//  NewsApp
//
//  Created by Mohannad on 3/6/22.
//

import UIKit
import Kingfisher

class InstructorCell : UITableViewCell {
    
    
    var titleLabel : UILabel = {
        let lab = UILabel()
        lab.text = "Instrcutor"
        lab.textColor = .black
        lab.font = UIFont.boldSystemFont(ofSize: 21)
        return lab
    }()
    
    
    var nameLabel : UILabel = {
        let lab = UILabel()
        lab.text = "Mohannad"
        lab.textColor = .gray
        lab.font = UIFont.boldSystemFont(ofSize: 16)
        return lab
    }()
    
    var InstructorImageView : UIImageView = {
        let img = UIImageView()
        img.contentMode = .scaleAspectFill
        img.backgroundColor = .darkGray
        img.layer.cornerRadius = 15
        return img
    }()
    
    lazy var mainStack : UIStackView =  {
       let stack = UIStackView(arrangedSubviews: [ InstructorImageView , infoStack])
       stack.axis = .horizontal
       stack.spacing = 15
       stack.distribution = .fill
       stack.alignment = .center
       return stack
    }()
    
    lazy var infoStack : UIStackView =  {
       let stack = UIStackView(arrangedSubviews: [titleLabel , nameLabel ])
       stack.axis = .vertical
       stack.spacing = 5
       stack.distribution = .fill
       return stack
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
    
    override func layoutSubviews() {
        InstructorImageView.layer.cornerRadius =  InstructorImageView.frame.height / 2
    }
    func configureUI(){
        contentView.addSubview(mainStack)
        
    }
    
    func configureConstraints(){
        mainStack.snp.makeConstraints { maker in
            maker.top.leading.equalTo(contentView).offset(4)
            maker.trailing.bottom.equalTo(contentView).offset(-4)
        }
        
       InstructorImageView.snp.makeConstraints { maker in
        maker.width.equalTo(mainStack.snp.width).multipliedBy(0.30)
        maker.height.equalTo(InstructorImageView.snp.width)
        
        }
    }
}

