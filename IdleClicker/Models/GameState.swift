//
//  GameState.swift
//  IdleClicker
//
//  Created by Hecatea on 1/24/24.
//

import Foundation

class GameState: ObservableObject {
    @Published var points = 0
    @Published var pps = 1
    @Published var pointGenerators:[PointGenerator] = [
        PointGenerator( name: "Royal Milk Tea", pps: 1, price: 50, level: 0, imgname: "royal"),
        PointGenerator( name: "Matcha Milk Tea", pps: 3, price: 100, level: 0, imgname: "matcha"),
        PointGenerator( name: "Taro Milk Tea", pps: 5, price: 250, level: 0, imgname: "taro"),
        PointGenerator( name: "Thai Milk Tea", pps: 10, price: 500, level: 0, imgname: "thai"),
        PointGenerator( name: "Brown Sugar Coffee", pps: 25, price: 1000, level: 0, imgname: "coffee"),
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
