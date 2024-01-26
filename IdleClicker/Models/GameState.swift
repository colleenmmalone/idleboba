//
//  GameState.swift
//  IdleClicker
//
//  Created by Hecatea on 1/24/24.
//

import Foundation
import SwiftUI


class GameState: ObservableObject {
    
//    let skyBlue = Color(red: 0.4627, green: 0.8392, blue: 1.0)
    
    @Published var points = 0
    @Published var pps = 1
    @Published var pointGenerators:[PointGenerator] = [
        PointGenerator( name: "Royal Milk Tea", pps: 1, price: 50, level: 0, imgname: "royal", bgColor: .bgRoyal),
        PointGenerator( name: "Matcha Milk Tea", pps: 3, price: 100, level: 0, imgname: "matcha",bgColor: .bgMatcha),
        PointGenerator( name: "Taro Milk Tea", pps: 5, price: 250, level: 0, imgname: "taro",bgColor: .bgTaro),
        PointGenerator( name: "Thai Milk Tea", pps: 10, price: 500, level: 0, imgname: "thai",bgColor: .bgThai),
        PointGenerator( name: "Brown Sugar Coffee", pps: 25, price: 1000, level: 0, imgname: "coffee",bgColor: .bgCoffee),
    ]
    
    var timer:Timer?
    
    init(){
        self.points = 1
        self.timer = Timer.scheduledTimer(withTimeInterval: 1.0, repeats: true, block: {_ in
            self.tick()
        })
    }
    
//    func click(){
//        self.points += 1
//    }
    
    func purchase(pointGenerator:PointGenerator){
        if pointGenerator.price <= self.points{
            self.points -= pointGenerator.price
            self.pps += pointGenerator.pps
            
            
            var newPointGenerators = self.pointGenerators
            let index = newPointGenerators.firstIndex(where: {$0.id == pointGenerator.id})!
            newPointGenerators[index].level += 1
            self.pointGenerators = newPointGenerators
        }
    }
    
    func tick(){
        self.points += self.pps
    }
    
    
    
}
