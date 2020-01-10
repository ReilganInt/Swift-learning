//
//  DetailViewController.swift
//  RootViewController
//
//  Created by admin on 24/12/2019.
//  Copyright © 2019 Rinat Kutuev. All rights reserved.
//

import UIKit
import SnapKit

class DetailViewController: UIViewController {
    
    //MARK:  Properties
    
    var dish: Dish?
    
    var detailView: UIView = {
        let detailView = UIView()
        detailView.backgroundColor = .white
        return detailView
    }()
    
    var imageView: UIImageView = {
        let iv = UIImageView()
        iv.contentMode = .scaleToFill
        iv.layer.cornerRadius = 20
        iv.layer.masksToBounds = true
        return iv
    }()
    
    var descriptionLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        return label
    }()
    
    var safeArea: UILayoutGuide!
    
    weak var delegate: DetailDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        safeArea = view.layoutMarginsGuide
        let recipeButton = UIBarButtonItem(barButtonSystemItem: .edit, target: self, action: #selector(makeRecipeViewController))
        navigationItem.setRightBarButton(recipeButton, animated: true)
        setupDetailView()
    }
    
    //MARK: - Setup Methods
    
    private func setupDetailView() {
        setupView()
        setupImageView()
        setupDescriptionLabel()
    }
    
    private func setupView() {
        view.addSubview(detailView)
        detailView.snp.makeConstraints { (make) in
            make.edges.equalTo(view)
        }
    }
    
    private func setupImageView() {
        detailView.addSubview(imageView)
        imageView.snp.makeConstraints { (make) -> Void in
            make.top.equalTo(safeArea)
            make.width.height.equalTo(300)
            make.centerX.equalTo(view.snp.centerX)
        }
        imageView.image = UIImage(named: dish?.image ?? "notFound")
    }
    
    private func setupDescriptionLabel() {
        detailView.addSubview(descriptionLabel)
        descriptionLabel.snp.makeConstraints { (make) in
            make.top.greaterThanOrEqualTo(imageView.snp.bottom).offset(10)
            make.height.lessThanOrEqualTo(safeArea.snp.height)
            make.width.equalTo(safeArea.snp.width)
            make.left.equalTo(safeArea.snp.left)
            make.right.equalTo(safeArea.snp.right)
        }
        descriptionLabel.text = dish?.description
    }
    
    @objc private func makeRecipeViewController() {
        let recipeVC = RecipeViewController()
        recipeVC.delegate = self
        recipeVC.modalPresentationStyle = .fullScreen
        recipeVC.modalTransitionStyle = .crossDissolve
        present(recipeVC, animated: true, completion: nil)
    }
    
}

//MARK: - Delegate Method

extension DetailViewController: RecipeDelegate {

    func sentMessageToChangeColor(color: UIColor) {
        detailView.backgroundColor = color
    }
    
    func sentMessageToClose() {
        navigationController?.popViewController(animated: true)
    }
    
    func sentMessageToChangeTitle() {
        delegate?.sentMessageToChangeTitle()
    }
}
