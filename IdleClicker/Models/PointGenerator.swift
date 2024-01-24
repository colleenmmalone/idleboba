//
//  PointGenerator.swift
//  IdleClicker
//
//  Created by Hecatea on 1/23/24.
//

import Foundation

struct PointGenerator: Identifiable{
    var id = UUID()
    var name:String
    var pps:Int
    var price:Int
    var level:Int
    var imgname:String
}
