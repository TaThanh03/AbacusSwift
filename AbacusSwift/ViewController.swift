//
//  ViewController.swift
//  AbacusSwift
//
//  Created by TA Trung Thanh on 08/10/2018.
//  Copyright © 2018 TA Trung Thanh. All rights reserved.
//

import UIKit

class Nombre: NSObject {
    private var nombre = 0
    
    func setNombre(val : Int) -> Void{
        nombre = val
    }
    func getTen() -> Int {
        return (Int)(nombre/10)
    }
    func getUnit() -> Int {
        return (Int)(nombre%10)
    }
    func getDecimal() -> String {
        return String(format: "%d", nombre)
    }
    func getHexadecimal() -> String {
        return String(format: "%x", nombre)
    }
    func getNombre() -> Int {
        return nombre
    }
}

class ViewController: UIViewController {
    @IBOutlet weak var outletStepper: UIStepper!
    @IBOutlet weak var outletSwitch: UISwitch!
    @IBOutlet weak var outletTens: UISegmentedControl!
    @IBOutlet weak var outletUnits: UISegmentedControl!
    @IBOutlet weak var outletSlider: UISlider!
    @IBOutlet weak var outletLabel: UILabel!
    
    
    var myNombre = Nombre()
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    @IBAction func actionStepperchanged(_ sender: Any) {
        myNombre.setNombre(val: Int(outletStepper.value))
        
        outletUnits.selectedSegmentIndex = myNombre.getUnit()
        outletTens.selectedSegmentIndex = myNombre.getTen()
        outletSlider.value = Float(myNombre.getNombre())
        if (myNombre.getNombre() == 42){
            outletLabel.textColor = UIColor.red
        }else{
            outletLabel.textColor = UIColor.black
        }
        if (outletSwitch.isOn){
            outletLabel.text = myNombre.getHexadecimal()
        }else{
            outletLabel.text = myNombre.getDecimal()
        }
    }
    @IBAction func actionSwitch(_ sender: Any) {
        actionStepperchanged(self)
    }
    @IBAction func actionTens(_ sender: Any) {
        myNombre.setNombre(val: outletTens.selectedSegmentIndex*10 + myNombre.getUnit())
        outletStepper.value = Double(Int(myNombre.getNombre()))
        actionStepperchanged(self)
    }
    @IBAction func actionUnits(_ sender: Any) {
        myNombre.setNombre(val: myNombre.getTen()*10 + outletUnits.selectedSegmentIndex)
        outletStepper.value = Double(Int(myNombre.getNombre()))
        actionStepperchanged(self)
    }
    @IBAction func actionSlider(_ sender: Any) {
        myNombre.setNombre(val: Int(outletSlider.value))
        outletStepper.value = Double(Int(myNombre.getNombre()))
        actionStepperchanged(self)
    }
    @IBAction func actionReset(_ sender: Any) {
        outletStepper.value = 0
        actionStepperchanged(self)
    }
}

