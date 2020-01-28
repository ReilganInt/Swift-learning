//
//  MainTableViewCell.swift
//  LoveYouFood
//
//  Created by admin on 20.01.2020.
//  Copyright © 2020 Rinat Kutuev. All rights reserved.
//

import UIKit
import SnapKit

class MainTableViewCell: UITableViewCell {

    // MARK: - Properties
    
    static let identifier = "mainCell"
        
    let photoImageView = UIImageView()
    let nameLabel = UILabel()
    let descriptionLabel = UILabel()
    
    // MARK: - Initialization
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        setupViewCell()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configure(withData data: DishModelProtocol) {
        nameLabel.text = data.name
        descriptionLabel.text = data.description
        photoImageView.image = UIImage(named: data.image ?? "defaultImage")
    }
    
    // MARK: - Private methods
    
    private func setupViewCell() {
        setupImageView()
        setupNameLabel()
        setupDescriptionlabel()
    }
    
    private func setupImageView() {
        addSubview(photoImageView)
        photoImageView.contentMode = .scaleToFill
        photoImageView.layer.cornerRadius = 10
        photoImageView.clipsToBounds = true
        photoImageView.snp.makeConstraints { make in
            make.left.top.equalTo(5)
            make.width.height.equalTo(90)
        }
    }
    
    private func setupNameLabel() {
        addSubview(nameLabel)
        nameLabel.textColor = UIColor.TableView.name
        nameLabel.snp.makeConstraints { make in
            make.top.equalTo(5)
            make.left.equalTo(photoImageView.snp.right).offset(5)
            make.right.equalTo(-5)
        }
    }
    
    private func setupDescriptionlabel() {
        addSubview(descriptionLabel)
        descriptionLabel.textColor = UIColor.TableView.description
        descriptionLabel.snp.makeConstraints { make in
            make.top.equalTo(nameLabel.snp.bottom).offset(5)
            make.left.equalTo(nameLabel.snp.left)
            make.right.equalTo(-5)
        }
    }
}
