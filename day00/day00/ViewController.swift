//
//  ViewController.swift
//  day00
//
//  Created by admin on 09/12/2019.
//  Copyright © 2019 admin. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func showAlertButtonTapped(_ sender: Any) {
        
        let myAlert = UIAlertController(title: "Hello", message: "Sbebank", preferredStyle: UIAlertController.Style.alert)
        
        myAlert.addAction(UIAlertAction(title: "Ok", style: UIAlertAction.Style.default, handler: nil))
        
        self.present(myAlert, animated: true, completion: nil)
        
    }
    
}

