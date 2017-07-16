//
//  ViewController.swift
//  Calculator2
//
//  Created by Ilya on 19.02.17.
//  Copyright © 2017 Ilya. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    // Переменные чисел
    var remNumber = 0.0 // Предыдущее число
    var memoryNumber = 0.0 // Число в памяти
    
    // Маркеры
    var point = false // Включение точки
    var opMarker = "" // Маркер операции
    var newNumber = true // Маркер нового числа
    
    // Объявление кнопок
    @IBOutlet weak var result: UILabel!
    @IBOutlet weak var mrButton: UIButton!
    
    
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
        if newNumber == true {
            result.text = "0."
            point = true
            newNumber = false
        }
        if point == false {
        result.text = result.text! + "."
        point = true
        }
        debugPrint(result.text!)
    } // Ставит точку
    
    @IBAction func ACbutton(_ sender: UIButton) {
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
        result.text = displayedNumber(number: String(remNumber))
        newNumber = true
        markeroff()
        debugPrint(remNumber)
        }
    } // Подсчёт результата (кнопка Равно)

    @IBAction func plusminusButton(_ sender: Any) {
        result.text = String(Double(result.text!)! - 2 * Double(result.text!)!)
        result.text = displayedNumber(number: result.text!)
    } // Переключает на противоположный знак
    
    @IBAction func mButton(_ sender: UIButton) {
        if result.text != "0" {
            if sender.currentTitle == "mr" {
                result.text = displayedNumber(number: String(memoryNumber))
            } else {
                memoryNumber = Double(result.text!)!
                mrButton.setTitle("mr", for: .normal)
                newNumber = true
                markeroff()
            }
        }
    }
    
    @IBAction func mcButton(_ sender: UIButton) {
        memoryNumber = 0
        mrButton.setTitle("M", for: .normal)
    }
    
    // Функции
    
    func markeroff() {
        point = false
        opMarker = ""
    } // Отключение маркеров
    
    func displayedNumber (number: String) -> String {
        let doubleNumber = Double(number)!
        let intNumber = Int(doubleNumber)
        var outNumber = ""
        if Double(intNumber) != doubleNumber {
            outNumber = "\(doubleNumber)"
        } else {
            outNumber = "\(intNumber)"
        }
        return outNumber
    } // Вывод числа с точкой или без
    
}

