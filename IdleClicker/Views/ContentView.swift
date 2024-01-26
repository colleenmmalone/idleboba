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
    // Allow level indicators to wrap or exchange
    // make whole bar clickable
    // add cute graphics
    
    
    var body: some View {
        VStack {
            HStack{
                HStack{
                    Image(.white)
                    Spacer()
                    VStack{
                        Text("$\(gameState.points)")
                            .font(.title)
                        Text("\(gameState.pps) dps")
                        
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
