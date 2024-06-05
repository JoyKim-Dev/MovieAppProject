//
//  HotContentTableViewCell.swift
//  MovieAppProject
//
//  Created by Joy Kim on 6/5/24.
//

import UIKit
import SnapKit

class HotContentTableViewCell: UITableViewCell {
    
    let rankLabel = {
        let l = UILabel()
        l.text = "1"
        l.backgroundColor = .systemPink
        l.textColor = .white
        l.textAlignment = .center
        l.font = .systemFont(ofSize: 15, weight: .heavy)
        return l
    }()
    
    let movieTitleLabel = {
        let m = UILabel()
        m.text = "엽문"
        m.backgroundColor = .clear
        m.layer.borderColor = .none
        m.textColor = .black
        m.textAlignment = .left
        m.font = .systemFont(ofSize: 15, weight: .heavy)
        return m
    }()
    
    let issueDateLabel = {
        let i = UILabel()
        i.text = "2022-04-01"
        i.backgroundColor = .clear
        i.textColor = .darkGray
        i.font = .systemFont(ofSize: 12, weight: .medium)
        return i
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        configureHierarchy()
        configureLayout()
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}

extension HotContentTableViewCell {
    
    func configureHierarchy() {
        contentView.addSubview(rankLabel)
        contentView.addSubview(movieTitleLabel)
        contentView.addSubview(issueDateLabel)
       
    }
    
    func configureLayout() {
        rankLabel.snp.makeConstraints { make in
            make.top.leading.bottom.equalTo(contentView).inset(10)
            make.width.equalTo(30)
            make.centerY.equalTo(contentView)
        
            
        }
        
        movieTitleLabel.snp.makeConstraints { make in
            make.leading.equalTo(rankLabel.snp.trailing).offset(20)
            make.trailing.equalTo(issueDateLabel.snp.leading).offset(-20)
            make.centerY.equalTo(contentView)
            make.height.equalTo(rankLabel)
            
        }
        
        issueDateLabel.snp.makeConstraints { make in
            make.top.trailing.bottom.equalTo(contentView).inset(10)
            make.width.equalTo(100)
            make.centerY.equalTo(contentView)
        }
        
    }
}
