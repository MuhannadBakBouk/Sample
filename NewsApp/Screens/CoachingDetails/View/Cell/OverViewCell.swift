//
//  OverViewCell.swift
//  NewsApp
//
//  Created by Mohannad on 3/6/22.
//
import UIKit
import Kingfisher

class OverViewCell : UITableViewCell {
    
    var descriptionTextView : UITextView = {
        let tv = UITextView()
        tv.text = "Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum."
        tv.textColor = .black
        tv.noneEditable()
        tv.noneScrollable()
        return tv
    }()
    
    var readMoreButton : UIButton = {
        let buttton = UIButton()
        buttton.text("ReadMore")
        buttton.textColor(.black)
        return buttton
    }()
    
    var videoImageView : UIImageView = {
        let img = UIImageView()
        img.contentMode = .scaleAspectFill
        img.backgroundColor = .darkGray
        img.layer.cornerRadius = 15
        return img
    }()
    
    lazy var mainStack : UIStackView =  {
       let stack = UIStackView(arrangedSubviews: [ descriptionTextView  , readMoreButton,  videoImageView])
       stack.axis = .vertical
       stack.spacing = 10
       stack.distribution = .fill
       stack.alignment = .leading
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
    
    func configureUI(){
        contentView.addSubview(mainStack)
    }
    
    func configureConstraints(){
        mainStack.snp.makeConstraints { maker in
            maker.top.leading.equalTo(contentView).offset(4)
            maker.trailing.bottom.equalTo(contentView).offset(-4)
        }
        
        descriptionTextView.snp.makeConstraints { maker in
            maker.height.equalTo(100)
        }
        
        videoImageView.snp.makeConstraints { maker in
            maker.width.equalTo(mainStack.snp.width)
            maker.height.equalTo(200)
        }
    }
}

