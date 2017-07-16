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
    var remNumber = 0.0 // Предыдущее число
    var memoryNumber = 0.0 // Число в памяти
    // Markers
    var point = false // Включение точки
    var opMarker = "" // Маркер операции
    var newNumber = true // Маркер нового числа
    
    @IBOutlet weak var result: UILabel!
    @IBOutlet weak var mcrButton: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    point = false
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    
    // Функции кнопок
    
    @IBAction func number(_ sender: UIButton) {
        if newNumber == true {
            newNumber = false
            result.text = "0"
        }
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
    } // Отключение маркеров
    
    @IBAction func ACbutton(_ sender: Any) {
        markeroff()
        remNumber = 0.0
        result.text = "0"
    } // Обнуляет все значения
    
    @IBAction func operationButton(_ sender: UIButton) {
        remNumber = Double(result.text!)!
        newNumber = true
        markeroff()
        opMarker = String(sender.currentTitle!)!
        debugPrint(remNumber, result.text!)
    } // Входит в режим Операция
    
    @IBAction func resultButton(_ sender: Any) {
        if remNumber != 0.0 {
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
        if Double(Int(remNumber)) != remNumber {
            result.text = String(remNumber)
            newNumber = true
        } else {
            result.text = String(Int(remNumber))
            newNumber = true
        }
        markeroff()
        debugPrint(remNumber)
        }
    } // Подсчёт результата (кнопка Равно)

    @IBAction func plusminusButton(_ sender: Any) {
        result.text = String(Double(result.text!)! - 2 * Double(result.text!)!)
    } // Переключает на противоположный знак
    
    @IBAction func mButton(_ sender: Any) {
        if result.text != "0" {
        memoryNumber = Double(result.text!)!
        mcrButton.setTitle("mr", for: .normal)
        markeroff()
        result.text = "0"
        }
    }
    
    @IBAction func mcButton(_ sender: UIButton) {
        if sender.currentTitle == "mr" {
            result.text = String(memoryNumber)
            mcrButton.setTitle("MC", for: .normal)
        } else {
            memoryNumber = 0
        }
        
    }
    
    
}

