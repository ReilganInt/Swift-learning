//
//  ViewController.swift
//  day01
//
//  Created by admin on 10/12/2019.
//  Copyright © 2019 admin. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    // Срабатывает после инилиазации всех свойств и методов
    // Срабатывает один раз, когда загружается в память
    // Но в данном этае мы еще не можем обращаться к геометрии нашей view
    // так как они еще не известны
    override func viewDidLoad() {
        super.viewDidLoad()
        
        print("viewDidLoad")
        // Do any additional setup after loading the view.
    }
    
    
    // Cрабатывает перед тем как View появится
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        // Можно использовать для более тонкой настройки View
        print("viewWillAppear")
    }
    
    override func updateViewConstraints() {
        // Здесь можем изменить знaчения констант констрейнтов
        super.updateViewConstraints()
    }
    
    override func viewWillLayoutSubviews() {
        // Здесь можно вручную задать размеры SubViews и их положения
        print("viewWillLayoutSubviews")
    }
    
    // Срабатывает AutoLayout
    
    override func viewDidLayoutSubviews() {
        // Cохранение последнего состояния объекта
        print("viewDidLayoutSubviews")
    }
    
    // Теперь можем обращаться к геометрии View
    
    // Срабатывает после появления View
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        // Вызывается, когда представление уже загружено и мы хотим
        // что-то показать
        print("viewDidAppear")
    }
    
    // Срабатывает при повороте экрана
    override func viewWillTransition(to size: CGSize, with coordinator: UIViewControllerTransitionCoordinator) {
        // Вызывается для обработки анимации при повороте
        print("viewWillTransition")
    }
    
    // Срабатывает когда появляется нехватка памяти для приложения
    override func didReceiveMemoryWarning() {
        // Здесь можем сохранить все нужные изменнения
        print("didReceiveMemoryWarning")
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        
        print("viewWillDisappear")
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        
        print("viewDidDisappear")
    }


}

