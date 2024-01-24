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
                Image(.coffee)
                Image(.matcha)
                Image(.thai)
                Image(.taro)
                Image(.royal)
            }
            HStack{
                Spacer()
                Button(action:{self.gameState.click()}){
                    Image("taro")
                    Text("Tap Here!")
                }
                    .padding()
                    .background(Color.pink)
                    .cornerRadius(5)
                    .foregroundColor(.white)
                Spacer()
                VStack{
                    Text("Points: \(gameState.points)")
                        .font(.headline)
                    if self.gameState.pps > 0 {
                        Text("Points Per Second: \(gameState.pps)")
                            .foregroundColor(.gray)
                    }
                }
                Spacer()
            
            }
            
            List(gameState.pointGenerators){pointGenerator in
                HStack{
                    VStack(alignment:.leading) {

                        Text(pointGenerator.name)
                            .font(.headline)
//                        HStack{
//                        Text("Level: ")
//                            if pointGenerator.level > 0{
//                                ForEach (1...pointGenerator.level, id:\.self) { level in
//                                    Circle()
//                                        .strokeBorder( .purple, lineWidth:4)
//                                        .frame(width: 15, height: 15)
//                                }
//                            }else{
//                                Text("0")
//                            }
                            if pointGenerator.level > 0{
                                Text("Level: \(pointGenerator.level)")
                            }else{}
                        Text("PPS: \(pointGenerator.pps)")
                        Text("Cost: $\(pointGenerator.price)")
                    }
                    Spacer()
                    Group{
                        
                            Button(action:{
                                self.gameState.purchase(pointGenerator: pointGenerator)
                            }){
                                VStack{
                                    if(self.gameState.points < pointGenerator.price){
                                        Image("boba")
                                    }else{
                                        Image(pointGenerator.imgname)
                                    }
                                    Text("Upgrade")}
                            }
                                .buttonStyle(BorderlessButtonStyle())
                                .disabled(self.gameState.points < pointGenerator.price)
                        
                    }
                }
            }
        }
    }
}

#Preview {
    ContentView()
}
