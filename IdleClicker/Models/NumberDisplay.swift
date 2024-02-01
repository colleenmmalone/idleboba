//
//  NumberDisplay.swift
//  IdleClicker
//
//  Created by Hecatea on 2/1/24.
//
import Foundation

func numberDisplay(num:Int) -> String {
    
    if num < Int(pow(Double(10), 3)) {
        return String(num)
    } else if num < Int(pow(Double(10), 6)) {
        return String(num / Int(pow(Double(10), 3))) + "k"
        
    } else if num < Int(pow(Double(10), 9)) {
        return String(num / Int(pow(Double(10), 6))) + "m"
        
    } else if num < Int(pow(Double(10), 12)) {
        return String(num / Int(pow(Double(10), 9))) + "b"
        
    } else if num < Int(pow(Double(10), 15)) {
        return String(num / Int(pow(Double(10), 12))) + "q"
        
    } else if num < Int(pow(Double(10), 18)) {
        return String(num / Int(pow(Double(10), 15))) + "p"
        
    } else if num < Int(pow(Double(10), 21)) {
        return String(num / Int(pow(Double(10), 18))) + "s"
      

                      
    } else {
        return "$$$"
    }
  
}
