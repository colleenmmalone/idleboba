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
            }
            .background(Color.black)
            .padding(20)
            .cornerRadius(30)
            
            
            List(gameState.pointGenerators){pointGenerator in
                if pointGenerator.level > 0 {
                    HStack{
                        Image(pointGenerator.imgname)
                            .frame(width: 52, height: 93)
                            .padding()
                        VStack() {
                            
                            Text(pointGenerator.name)
                                .font(.title)
                            
                            HStack{
                                VStack{
                                    Text("PPS: \(pointGenerator.pps)")
                                    Text("Cost: $\(pointGenerator.price)")
                                }
                                
                                if pointGenerator.price > gameState.points{
                                    Button(action:{
                                        self.gameState.purchase(pointGenerator: pointGenerator)
                                    }){
                                        
                                        Text("$\(pointGenerator.price)")
                                            .font(.headline)
                                        Text("+\(pointGenerator.pps) dps")
                                    }
                                    .cornerRadius(8)
                                    .disabled(true)
                                }else{
                                    Button(action:{
                                        self.gameState.purchase(pointGenerator: pointGenerator)
                                    }){
                                        
                                        Text("$\(pointGenerator.price)")
                                            .font(.headline)
                                        Text("+\(pointGenerator.pps) dps")
                                    }
                                    .background(Color.green)
                                    .foregroundStyle(Color.white)
//                                    .border(.black)
                                    .cornerRadius(8)
                                    
                                }
                            }
                            
                        }
                    }
                    
                    
                    .background(Color.gray)
                    .cornerRadius(12)
                }else{
                    
                    HStack{
                        Image(.gray)
                            .frame(width: 52, height: 93)
                            .padding()
                        VStack() {
                            
                            Text("???")
                                .font(.title)
                            
                            HStack{
                                VStack{
                                    Text("Upgrade")
                                        .font(.headline)
                                }
                                if pointGenerator.price > gameState.points{
                                    Button(action:{
                                        self.gameState.purchase(pointGenerator: pointGenerator)
                                    }){
                                        
                                        Text("$\(pointGenerator.price)")
                                            .font(.headline)
                                        Text("+\(pointGenerator.pps) dps")
                                    }
                                    .cornerRadius(8)
                                    .disabled(true)
                                }else{
                                    Button(action:{
                                        self.gameState.purchase(pointGenerator: pointGenerator)
                                    }){
                                        
                                        Text("$\(pointGenerator.price)")
                                            .font(.headline)
                                        Text("+\(pointGenerator.pps) dps")
                                    }
                                    .background(Color.green)
                                    .foregroundStyle(Color.white)
//                                    .border(.black)
                                    .cornerRadius(8)
                                    
                                }
                            }
                            
                        }
                    }
                }
                Spacer()
                       
                        
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
                        //                            if pointGenerator.level > 0{
                        //                                Text("Level: \(pointGenerator.level)")
                        //                            }else{}
                        //                        Text("PPS: \(pointGenerator.pps)")
                        //                        Text("Cost: $\(pointGenerator.price)")
                        //                    }

                    
                }
            
        }
    }
}

#Preview {
    ContentView()
}
