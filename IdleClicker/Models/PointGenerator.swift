//
//  PointGenerator.swift
//  IdleClicker
//
//  Created by Hecatea on 1/23/24.
//

import Foundation
import SwiftUI

struct PointGenerator: Identifiable{
    var id = UUID()
    var name:String
    var level:Int
    var priceBase:Int
//    var dpsBase:Int
    var price:Int
    var dps:Int
    var coefficient:Double
    var imgname:String
    var bgColor:Color
}
