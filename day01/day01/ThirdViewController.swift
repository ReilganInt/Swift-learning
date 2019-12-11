//
//  ThirdViewController.swift
//  day01
//
//  Created by admin on 10/12/2019.
//  Copyright © 2019 admin. All rights reserved.
//

import UIKit

class ThirdViewController: UIViewController {

    // Срабатывает после инилиазации всех свойств и методов
    // Срабатывает один раз, когда загружается в память
    // Но в данном этае мы еще не можем обращаться к геометрии нашей view
    // так как они еще не известны
    override func viewDidLoad() {
        super.viewDidLoad()
        
        print("viewDidLoad from third view controller")
        // Do any additional setup after loading the view.
    }
    
    
    // Cрабатывает перед тем как View появится
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        // Можно использовать для более тонкой настройки View
        print("viewWillAppear from third view controller")
    }
    
    override func updateViewConstraints() {
        // Здесь можем изменить знaчения констант констрейнтов
        super.updateViewConstraints()
    }
    
    override func viewWillLayoutSubviews() {
        // Здесь можно вручную задать размеры SubViews и их положения
        print("viewWillLayoutSubviews from third view controller")
    }
    
    // Срабатывает AutoLayout
    
    override func viewDidLayoutSubviews() {
        // Cохранение последнего состояния объекта
        print("viewDidLayoutSubviews from third view controller")
    }
    
    // Теперь можем обращаться к геометрии View
    
    // Срабатывает после появления View
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        // Вызывается, когда представление уже загружено и мы хотим
        // что-то показать
        print("viewDidAppear from third view controller")
    }
    
    // Срабатывает при повороте экрана
    override func viewWillTransition(to size: CGSize, with coordinator: UIViewControllerTransitionCoordinator) {
        // Вызывается для обработки анимации при повороте
        print("viewWillTransition from third view controller")
    }
    
    // Срабатывает когда появляется нехватка памяти для приложения
    override func didReceiveMemoryWarning() {
        // Здесь можем сохранить все нужные изменнения
        print("didReceiveMemoryWarning from third view controller")
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        
        print("viewWillDisappear from third view controller")
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        
        print("viewDidDisappear from third view controller")
    }
    
    @IBAction func closeThirdviewControllerButton(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
        print("Close button is tapped")
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
