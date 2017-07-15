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
    var remNumber = 0.0 // Предыдущее число
    // Markers
    var point = false // Включение точки
    var opMarker = ""
    
    @IBOutlet weak var result: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    m = 0
    p = 0
    point = false
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    
    // Функции кнопок
    
    @IBAction func number(_ sender: UIButton) {
        if result.text == "0" {
            if String(sender.currentTitle!)! != "0" {
                result.text = String(sender.currentTitle!)!}
            }
        else {
            result.text = result.text! + String(sender.currentTitle!)!
            debugPrint(result.text!)
        }
    } // Выводит на экран введенное число
    
    @IBAction func point(_ sender: UIButton) {
        if point == false {
        result.text = result.text! + "."
        point = true
        }
        debugPrint(result.text!)
    } // Ставит точку

    func markeroff() {
        point = false
        opMarker = ""
    }
    
    @IBAction func ACbutton(_ sender: Any) {
    m = 0
    p = 0
    markeroff()
    result.text = "0"
    } // Обнуляет все значения
    
    @IBAction func operationButton(_ sender: UIButton) {
    remNumber = Double(result.text!)!
    result.text = "0"
    m = 0
    p = 0
    markeroff()
    opMarker = String(sender.currentTitle!)!
    debugPrint(remNumber, result.text!)
    } // Входит в режим Операция
    
    @IBAction func resultButton(_ sender: Any) {
        switch opMarker {
        case "+":
            remNumber = remNumber + Double(result.text!)!
        case "-":
            remNumber = remNumber - Double(result.text!)!
        case "*":
            remNumber = remNumber * Double(result.text!)!
        case "/":
            remNumber = remNumber / Double(result.text!)!
        default: break
        }
    result.text = String(remNumber)
    markeroff()
    debugPrint(remNumber)
    }

    
}

