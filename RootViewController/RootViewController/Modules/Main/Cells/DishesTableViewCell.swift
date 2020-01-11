//
//  DishesTableViewCell.swift
//  RootViewController
//
//  Created by admin on 24/12/2019.
//  Copyright © 2019 Rinat Kutuev. All rights reserved.
//

import UIKit
import SnapKit

class DishesTableViewCell: UITableViewCell {
    
    //MARK: Properties
    
    static let cellId = "cellId"
    
    var safeArea: UILayoutGuide!
    let imageIV = UIImageView()
    let nameLabel = UILabel()
    let descriptionLabel = UILabel()

    //MARK: Initializations
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    //MARK: Setup
    
    func setupView() {
        safeArea = layoutMarginsGuide
        setupImageView()
        setupNameLabel()
        setupDescriptionLabel()
    }
    
    func setupImageView() {
        addSubview(imageIV)
        imageIV.contentMode = .scaleToFill
        imageIV.layer.cornerRadius = 20
        imageIV.layer.masksToBounds = true
        imageIV.snp.makeConstraints { make in
            make.left.top.equalTo(0)
            make.width.height.equalTo(90)
        }
    }
    
    func setupNameLabel() {
        addSubview(nameLabel)
        nameLabel.snp.makeConstraints { make in
            make.top.equalTo(5)
            make.left.equalTo(imageIV.snp.right).offset(5)
            make.right.equalTo(-5)
        }
    }
    
    func setupDescriptionLabel() {
        addSubview(descriptionLabel)
        descriptionLabel.snp.makeConstraints { make in
            make.top.equalTo(nameLabel.snp.bottom).offset(5)
            make.left.equalTo(nameLabel)
            make.right.equalTo(-5)
        }
    }
    
}
