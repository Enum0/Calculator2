//
//  ViewController.swift
//  Calculator2
//
//  Created by Ilya on 19.02.17.
//  Copyright © 2017 Ilya. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    // Memory
    var m = 0 // Целое число
    var p = 0 // Дробная часть
    // Markers
    var point = false // Включение точки
    var plus = false // Включение кнопки "Плюс"
    
    @IBOutlet weak var result: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    m = 0
    point = false
    plus = false
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    
    // Функции кнопок
    
    @IBAction func number(_ sender: UIButton) {
        if point == false {
            m = m*10 + Int(sender.currentTitle!)!
            result.text = String(m)} else {
            p = p*10 + Int(sender.currentTitle!)!
            result.text = String(m) + "." + String(p)
        }
    debugPrint(m, p)
    } // Выводит на экран введенное число

    @IBAction func point(_ sender: Any) {
        if point != true {
            point = true
            result.text = String(m) + "."}
    } // Ставит точку

    @IBAction func ACbutton(_ sender: Any) {
    m = 0
    p = 0
    point = false
    result.text = "0"
    } // Обнуляет все значения
    
    @IBAction func plusButton(_ sender: Any) {

    }
    
}

