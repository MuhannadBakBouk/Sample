//
//  TabCell.swift
//  NewsApp
//
//  Created by Mohannad on 3/6/22.
//
import UIKit
import Kingfisher

class TabCell : UICollectionViewCell {
    
    var model : TabViewData!
    
    var titleLabel : UILabel = {
        let lab = UILabel()
        lab.text = "OverView"
        lab.textColor = .black
        lab.font = UIFont.boldSystemFont(ofSize: 18)
        lab.numberOfLines = 0
        lab.textAlignment = .natural
        return lab
    }()
    
    var barView : UIView = {
        let view = UIView()
        view.backgroundColor = .black
        return view
    }()


    override init(frame: CGRect) {
        super.init(frame: frame)
        configureUI()
        configureConstraints()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        fatalError()
    }
    
    func configureUI(){
        contentView.addSubview(titleLabel)
        contentView.addSubview(barView)
    }
    
    func configureConstraints(){
        titleLabel.snp.makeConstraints { maker in
            maker.top.leading.equalTo(contentView).offset(4)
            maker.trailing.equalTo(contentView).offset(-4)
        }
       
        barView.snp.makeConstraints { maker in
            maker.width.equalTo(contentView.snp.width).multipliedBy(0.7)
            maker.height.equalTo(1)
            maker.bottom.equalTo(contentView.snp.bottom).offset(-4)
            maker.leading.equalTo(titleLabel.snp.leading)
        }
       
    }
    
    func setup(with value : TabViewData)  {
        titleLabel.text = value.name
        barView.isHidden = !value.isActive
        titleLabel.textColor = value.isActive ? .black : .systemGray
    }
}
