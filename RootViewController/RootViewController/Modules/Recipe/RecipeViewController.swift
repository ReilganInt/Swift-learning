//
//  RecipeViewController.swift
//  RootViewController
//
//  Created by admin on 25/12/2019.
//  Copyright © 2019 Rinat Kutuev. All rights reserved.
//

import UIKit

class RecipeViewController: UIViewController {

    var safeArea: UILayoutGuide!
    
    var changeColorButton: UIButton = {
        let changeColorButton = UIButton()
        changeColorButton.backgroundColor = .red
        changeColorButton.setTitle("Change Previous Background Color", for: .normal)
        return changeColorButton
    }()
    
    var changeTitleButton: UIButton = {
        let changeTitleButton = UIButton()
        changeTitleButton.backgroundColor = .blue
        changeTitleButton.setTitle("Change Main Title", for: .normal)
        return changeTitleButton
    }()
    
    var closeButton: UIButton = {
        let closeButton = UIButton(type: .close)
        closeButton.backgroundColor = .red
        return closeButton
    }()
    
    weak var delegate: RecipeDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        safeArea = view.layoutMarginsGuide
        view.backgroundColor = .white
        setupColorButton()
        setupTitleButton()
        setupClosebutton()
    }
    
    private func setupColorButton() {
        view.addSubview(changeColorButton)
        changeColorButton.addTarget(self, action: #selector(changePreviousBackgroundColor), for: .touchUpInside)
        changeColorButton.snp.makeConstraints { (make) in
            make.width.equalTo(view.snp.width)
            make.height.equalTo(50)
            make.center.equalTo(view.snp.center)
        }
    }
    
    private func setupTitleButton() {
        view.addSubview(changeTitleButton)
        changeTitleButton.addTarget(self, action: #selector(changeMainTitle), for: .touchUpInside)
        changeTitleButton.snp.makeConstraints { (make) in
            make.width.equalTo(view.snp.width)
            make.height.equalTo(50)
            make.top.equalTo(changeColorButton.snp.bottom)
        }
    }
    
    private func setupClosebutton() {
        view.addSubview(closeButton)
        closeButton.addTarget(self, action: #selector(popToMain), for: .touchUpInside)
        closeButton.snp.makeConstraints { (make) in
            make.width.height.equalTo(50)
            make.right.equalTo(0)
            make.top.equalTo(safeArea)
        }
        
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
