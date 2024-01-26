//
//  BuyButton.swift
//  IdleClicker
//
//  Created by Hecatea on 1/26/24.
//

import SwiftUI

struct BuyButton: View {
    @ObservedObject var gameState = GameState()
    
    //    let price: Int
    //    let pps: Int
    let pg: PointGenerator
    let isDisabled: Bool
    //
    //    var bgColor: Color
    //    var textColor: Color
    //    var borderColor: Color
    //
    
    
    
    var body: some View {
        
        Button(action:{
            self.gameState.purchase(pointGenerator: pg)
        }){
            let bgColor = isDisabled ? Color.ltGray : Color.ltGreen
            let textColor = isDisabled ? Color.dkGray : Color.dkGreen
            let borderColor = isDisabled ? Color.mdGray : Color.mdGreen
            VStack{
                Text("$\(pg.price)")
                    .font(.system(size: 18))
                
                Text("+\(pg.pps) dps")
                    .font(.system(size: 12))
            }
            .frame(width: 75, height: 50)
            .foregroundStyle(textColor)
            .background(bgColor)
            .overlay(
                RoundedRectangle(cornerRadius: 8)
                    .stroke(borderColor, lineWidth: 2)
            )
            
            
        }
        .cornerRadius(8)
    }

}

struct BuyButton_Previews: PreviewProvider {
    static var previews: some View {
        @ObservedObject var gameState = GameState()
        BuyButton(gameState: gameState, pg: gameState.pointGenerators[0], isDisabled: false)
        
    }
}
