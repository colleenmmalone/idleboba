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
    @Published var dps = 1
    @Published var pointGenerators:[PointGenerator] = [
        PointGenerator( 
            name: "Royal Milk Tea",
            level: 0,
            priceBase: 4,
            price: 4,
            dps: 1,
            coefficient: 1.07,
            imgname: "royal",
            bgColor: .bgRoyal
        ),
        PointGenerator(
            name: "Matcha Milk Tea",
            level: 0,
            priceBase: 60,
            price: 60,
            dps: 20,
            coefficient: 1.15,
            imgname: "matcha",
            bgColor: .bgMatcha
        ),
        PointGenerator( 
            name: "Taro Milk Tea", 
            level: 0,
            priceBase:720,
            price: 720,
            dps: 90,
            coefficient: 1.14,
            imgname: "taro",
            bgColor: .bgTaro
        ),
        PointGenerator(
            name: "Thai Milk Tea", 
            level: 0,
            priceBase: 8640,
            price: 8640,
            dps: 360,
            coefficient: 1.13,
            imgname: "thai",
            bgColor: .bgThai
        ),
        PointGenerator(
            name: "Brown Sugar Coffee", 
            level: 0,
            priceBase: 103680,
            price: 103680,
            dps: 2160,
            coefficient: 1.12,
            imgname: "coffee",
            bgColor: .bgCoffee
        ),
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
            self.dps += pointGenerator.dps
            
            var newPointGenerators = self.pointGenerators
            let index = newPointGenerators.firstIndex(where: {$0.id == pointGenerator.id})!
            newPointGenerators[index].level += 1
            newPointGenerators[index].price = Int( Double(newPointGenerators[index].priceBase) * pow(newPointGenerators[index].coefficient, Double(newPointGenerators[index].level)))
//            newPointGenerators[index].dps = newPointGenerators[index].dpsBase * Int(pow(newPointGenerators[index].coefficient, Double(newPointGenerators[index].level)))
            self.pointGenerators = newPointGenerators
            
            
        }
    }
    
    func tick(){
        self.points += self.dps
    }
    
    func click(){
        self.points += 1
    }
    
    
    
}
