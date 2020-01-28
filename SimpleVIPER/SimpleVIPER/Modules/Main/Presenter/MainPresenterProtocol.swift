//
//  MainPresenterProtocol.swift
//  SimpleVIPER
//
//  Created by admin on 27.01.2020.
//  Copyright © 2020 Rinat Kutuev. All rights reserved.
//

import Foundation

protocol MainPresenterProtocol: class {
    var router: MainRouterProtocol! { set get }
    func configureView()
    func randomButtonClicked()
    func newsButtonClicked()
    func dishButtonClicked()
}
