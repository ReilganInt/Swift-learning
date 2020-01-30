//
//  DetailTableViewCell.swift
//  TestingViper
//
//  Created by admin on 29.01.2020.
//  Copyright © 2020 Rinat Kutuev. All rights reserved.
//

import UIKit

class DetailTableViewCell: UITableViewCell {

    // MARK: - Properties
    
    static let identifier = "detailCell"
    
    let photoImageView = UIImageView()
    let titleLabel = UILabel()
    let decriptionLabel = UILabel()
    
    // MARK: - Initialization
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        setupViewCell()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configure(withData data: PostModelProtocol) {
        titleLabel.text = data.title
        decriptionLabel.text = data.text
        photoImageView.image = UIImage(named: data.imageURLString)
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
        addSubview(titleLabel)
        titleLabel.textColor = .black
        titleLabel.snp.makeConstraints { make in
            make.top.equalTo(5)
            make.left.equalTo(photoImageView.snp.right).offset(5)
            make.right.equalTo(-5)
        }
    }
    
    private func setupDescriptionlabel() {
        addSubview(decriptionLabel)
        decriptionLabel.textColor = .black
        decriptionLabel.snp.makeConstraints { make in
            make.top.equalTo(titleLabel.snp.bottom).offset(5)
            make.left.equalTo(titleLabel.snp.left)
            make.right.equalTo(-5)
        }
    }
}
