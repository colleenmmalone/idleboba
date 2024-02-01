//
//  ContentView.swift
//  IdleClicker
//
//  Created by Hecatea on 1/23/24.
//

import SwiftUI

struct ContentView: View {
    @ObservedObject var gameState = GameState()
    
    // user core data to save progress
    // add option to restart
    // add a menu
    // add cute graphics
    // have an animated scene of people or boba
    // move recipes to a menu
    // add options to improve boba maker or milk options
    //    make top bar clickable 
    
    
    var body: some View {
        VStack {
            //            Text(numberDisplay(num: 3))
            
            //            HStack{
            Button(action:{
                self.gameState.click()
            }){
                HStack{
                    Image(.white)
                    Spacer()
                    VStack{
                        Text("$\(numberDisplay(num:gameState.points))")
                            .font(.title)
                        Text("\(numberDisplay(num:gameState.dps)) dps")
                        
                    }.foregroundStyle(Color.white)
                    Spacer()
                    Image(.white)
                }
                .padding(20)
                .cornerRadius(30)
            }
            .background(Color.black)
            .padding(20)
            .cornerRadius(30)
            
            
            List(gameState.pointGenerators){pointGenerator in
                RecipeCard(gameState: gameState, pg: pointGenerator)
            }
        }
    }
}

#Preview {
    ContentView()
}
