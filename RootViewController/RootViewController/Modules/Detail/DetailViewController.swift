//
//  DetailViewController.swift
//  RootViewController
//
//  Created by admin on 24/12/2019.
//  Copyright © 2019 Rinat Kutuev. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {
    
    //MARK:  Properties
    
    var dish: Dish?
        
    var detailView: UIScrollView!
    var recipeButton: UIButton!
    var imageView = UIImageView()
    
    weak var delegate: DetailDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setupDetailView()
    }
    
    
    //MARK: - Setup Methods
    
    private func setupDetailView() {
    
        setupSrollView()
        setupImageView()
        setupRecipeButton()
    }
    
    private func setupSrollView() {
        
        detailView = UIScrollView(frame: view.frame)
        view.addSubview(detailView)
        detailView.backgroundColor = .white
    }
    
    
    private func setupImageView() {
        
        detailView.addSubview(imageView)
        
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        imageView.widthAnchor.constraint(equalToConstant: view.bounds.width).isActive = true
        imageView.heightAnchor.constraint(equalToConstant: view.bounds.width).isActive = true

        imageView.image = UIImage(named: dish?.image ?? "defaultPhoto")
        
    }
    
    private func setupRecipeButton() {
        
        let navigationBar = navigationController?.navigationBar
        
        recipeButton = UIButton(frame: CGRect(x: 0, y: view.bounds.width + (navigationBar?.bounds.height ?? 50), width: view.bounds.width, height: 50))
        recipeButton.addTarget(self, action: #selector(makeRecipeViewController), for: .touchUpInside)
        
        recipeButton.backgroundColor = .blue
        recipeButton.setTitle("Got to RecipeVC", for: .normal)
        
        view.addSubview(recipeButton)
    }
    
    @objc private func makeRecipeViewController() {
        detailView.backgroundColor = .white
        
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
