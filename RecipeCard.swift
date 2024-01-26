//
//  RecipeCard.swift
//  IdleClicker
//
//  Created by Hecatea on 1/26/24.
//

import SwiftUI

struct RecipeCard: View {
    @ObservedObject var gameState = GameState()

    let pg: PointGenerator
   
    var body: some View {
        
        let isLocked = (pg.level == 0) ? true : false
        
        HStack{
            Image(isLocked ? "gray" : pg.imgname)
                .frame(width: 52, height: 93)
                .padding(.leading)
            VStack() {
                Text( isLocked ? "???" : pg.name)
                    .font(.system(size: 22))
                    .frame(minWidth: 0, maxWidth: .infinity)
                    
                HStack{
                    isLocked ? (VStack{
                        Text("Unlock")
                            .font(.system(size: 18))
                            .bold()
                        Text("")
                            .font(.system(size: 0))
                    })
                    .padding(.horizontal)
                    :
                    (VStack{
                        Text("Lvl \(pg.level)")
                            .font(.headline)
                        Text("PPS: \(pg.pps)")
                            .font(.system(size: 12))
                    })
                    .padding(.horizontal)
                    Spacer()
//                    if pg.price > gameState.points{
                        BuyButton(gameState: gameState, pg: pg, isDisabled: (pg.price > gameState.points))
                        
//                    }else{
//                        BuyButton(gameState: gameState, pg: pg, isDisabled: false)
//                    }
                }
                
            }
            .padding(.all)
        }
        .background(LinearGradient(gradient: Gradient(colors: [Color.white, isLocked ? Color.bgLocked : pg.bgColor ]), startPoint: .leading, endPoint: .trailing))
        .cornerRadius(12)
//        .padding(.zero)
        .frame(minWidth: 0, maxWidth: .infinity)
        
    }
}
    
    struct RecipeCard_Previews: PreviewProvider {
        static var previews: some View {
            @ObservedObject var gameState = GameState()
            RecipeCard(gameState: gameState, pg: gameState.pointGenerators[4])
        }
    
    
    
}
