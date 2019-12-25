//
//  RecipeViewController.swift
//  RootViewController
//
//  Created by admin on 25/12/2019.
//  Copyright © 2019 Rinat Kutuev. All rights reserved.
//

import UIKit

class RecipeViewController: UIViewController {

    var changeColorButton: UIButton!
    var changeTitleButton: UIButton!
    var closeButton: UIButton!
    
    weak var delegate: RecipeDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .white
        setupColorButton()
        setupTitleButton()
        setupClosebutton()
    }
    
    private func setupColorButton() {
        changeColorButton = UIButton(frame: CGRect(x: 0, y: view.bounds.width , width: view.bounds.width, height: 50))
        
        changeColorButton.addTarget(self, action: #selector(changePreviousBackgroundColor), for: .touchUpInside)
        
        changeColorButton.backgroundColor = .red
        changeColorButton.setTitle("Change Previous Background Color", for: .normal)
        
        view.addSubview(changeColorButton)
    }
    
    private func setupTitleButton() {
        changeTitleButton = UIButton(frame: CGRect(x: 0, y: view.bounds.width + 50, width: view.bounds.width, height: 50))
        changeTitleButton.addTarget(self, action: #selector(changeMainTitle), for: .touchUpInside)
        
        changeTitleButton.backgroundColor = .blue
        changeTitleButton.setTitle("Change Main Title", for: .normal)
        
        view.addSubview(changeTitleButton)
    }
    
    private func setupClosebutton() {
        closeButton = UIButton(type: .close)
        closeButton.frame = CGRect(x: view.bounds.width - 50, y: 50, width: 50, height: 50)
        
        closeButton.backgroundColor = .red
        
        closeButton.addTarget(self, action: #selector(popToMain), for: .touchUpInside)
        
        view.addSubview(closeButton)
    }
    
    @objc func changePreviousBackgroundColor() {
        delegate?.sentMessageToChangeColor(color: .green)
    }
    
    @objc func changeMainTitle() {
        delegate?.sentMessageToChangeTitle()
    }
    
    @objc func popToMain() {
        dismiss(animated: true)
        delegate?.sentMessageToClose()
    }

}
