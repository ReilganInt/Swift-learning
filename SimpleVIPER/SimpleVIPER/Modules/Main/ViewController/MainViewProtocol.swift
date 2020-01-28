//
//  MainViewProtocol.swift
//  SimpleVIPER
//
//  Created by admin on 27.01.2020.
//  Copyright © 2020 Rinat Kutuev. All rights reserved.
//

import Foundation

protocol MainViewProtocol: class {
    func setRandomButton(with titleString: String?)
    func setNewsButton(with titleString: String?)
    func setDishButton(with titleString: String?)
    func setActivityIndicator()
    func showAlertView(with text: String)
    func showSpinner()
    func hideSpinner()
}
