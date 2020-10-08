//
//  ContentView.swift
//  Spinner
//
//  Created by SM Arif Ahmed on 7/10/20.
//  Copyright © 2020 SM Arif Ahmed. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    
   @State private var imageSymbols = ["1", "2", "3"]
    @State private var imageBackgrounds = [Color.white,Color.white,Color.white,Color.white,Color.white,Color.white,Color.white,Color.white,Color.white]
    //@State private var numbers = [0, 1, 2]
    @State private var credits = 1000
    @State private var cardNumber = [0,1,2,1,2,0,0,1,2]
    private var bet = 5
    
    
    var body: some View {
        ZStack{
                
            Rectangle().foregroundColor(Color(red: 255/255, green :  51/255, blue: 51/255)).edgesIgnoringSafeArea(.all)
            Rectangle().foregroundColor(Color(red: 255/255, green :  153/255, blue: 153/255)).rotationEffect(Angle(degrees: 135)).edgesIgnoringSafeArea(.all)
            
            VStack{
                
                //Title
                HStack{
                    Image(systemName: "star.fill")
                        .foregroundColor(.yellow)
                    Text("Let's Gamble")
                        .bold()
                        .foregroundColor(Color.white)
                    Image(systemName: "star.fill")
                        .foregroundColor(.yellow)
                }.scaleEffect(2)
                    .padding(.top, 20
                        
                )
                
                 Spacer()
                
                //Credits counter
                Text("Credits: " + String(credits))
                .bold()
                    .foregroundColor(.black)
                    .padding(.all, 14)
                    .background(Color.white.opacity(0.6))
                    .cornerRadius(20)
                 Spacer()
                
                VStack{
                    HStack{
                        Spacer()
                        
                        ImageCardView(imageName: $imageSymbols[cardNumber[0]], imageBackground: $imageBackgrounds[0])
                        ImageCardView(imageName: $imageSymbols[cardNumber[1]], imageBackground: $imageBackgrounds[1])
                        ImageCardView(imageName: $imageSymbols[cardNumber[2]], imageBackground: $imageBackgrounds[2])
                        
                        Spacer()
                    }
                    
                    HStack{
                        Spacer()
                        
                        ImageCardView(imageName: $imageSymbols[cardNumber[3]], imageBackground: $imageBackgrounds[3])
                        ImageCardView(imageName: $imageSymbols[cardNumber[4]], imageBackground: $imageBackgrounds[4])
                        ImageCardView(imageName: $imageSymbols[cardNumber[5]], imageBackground: $imageBackgrounds[5])
                        
                        Spacer()
                    }
                    
                    HStack{
                        Spacer()
                        
                        ImageCardView(imageName: $imageSymbols[cardNumber[6]], imageBackground: $imageBackgrounds[6])
                        ImageCardView(imageName: $imageSymbols[cardNumber[7]], imageBackground: $imageBackgrounds[7])
                        ImageCardView(imageName: $imageSymbols[cardNumber[8]], imageBackground: $imageBackgrounds[8])
                        
                        Spacer()
                    }
                    
                }
                
               
                
                 Spacer()
                
                HStack{
                   /* Button(action: {
                        
                        self.imageBackgrounds = self.imageBackgrounds.map({ _ in Color.white
                        })
                        
                        
                        self.cardNumber [3] = Int.random(in: 0...2)
                         self.cardNumber [4] = Int.random(in: 0...2)
                         self.cardNumber [5] = Int.random(in: 0...2)
                        
                        
                    
                        
                        
                        if self.cardNumber[3]==self.cardNumber[4] && self.cardNumber[4]==self.cardNumber[5]{
                            
                            self.credits += self.bet * 10
                            
                           /* self.imageBackgrounds = self.imageBackgrounds.map({ _ in Color.green
                            })*/
                            
                            self.imageBackgrounds[3] = Color.green
                            self.imageBackgrounds[4] = Color.green
                            self.imageBackgrounds[5] = Color.green
                            
                        }
                        
                        else{
                            self.credits -= self.bet
                        }
                        
                        
                    }) {
                        Text("Spin the middle row")
                            .bold()
                            .foregroundColor(Color.white)
                            .padding()
                            .padding([.leading, .trailing], 20)
                            .background(Color.purple)
                            .cornerRadius(20)
                    }*/
                    
                    Button(action: {
                        
                        self.imageBackgrounds = self.imageBackgrounds.map({ _ in Color.white
                        })
                        
                        
                        self.cardNumber = self.cardNumber.map({ _ in Int.random(in: 0...2)
                        })
                        
                        if self.cardNumber[0]==self.cardNumber[3] && self.cardNumber[3]==self.cardNumber[6]{
                            
                            self.credits += self.bet * 10
                            
                           /* self.imageBackgrounds = self.imageBackgrounds.map({ _ in Color.green
                            })*/
                            
                            self.imageBackgrounds[0] = Color.green
                            self.imageBackgrounds[3] = Color.green
                            self.imageBackgrounds[6] = Color.green
                            
                        }
                        
                        if self.cardNumber[4]==self.cardNumber[1] && self.cardNumber[1]==self.cardNumber[7]{
                            
                            self.credits += self.bet * 10
                            
                           /* self.imageBackgrounds = self.imageBackgrounds.map({ _ in Color.green
                            })*/
                            
                            self.imageBackgrounds[4] = Color.green
                            self.imageBackgrounds[1] = Color.green
                            self.imageBackgrounds[7] = Color.green
                            
                        }
                        
                        if self.cardNumber[2]==self.cardNumber[5] && self.cardNumber[5]==self.cardNumber[8]{
                            
                            self.credits += self.bet * 10
                            
                           /* self.imageBackgrounds = self.imageBackgrounds.map({ _ in Color.green
                            })*/
                            
                            self.imageBackgrounds[2] = Color.green
                            self.imageBackgrounds[5] = Color.green
                            self.imageBackgrounds[8] = Color.green
                            
                        }
                        
                        if self.cardNumber[0]==self.cardNumber[1] && self.cardNumber[1]==self.cardNumber[2]{
                            
                            self.credits += self.bet * 10
                            
                           /* self.imageBackgrounds = self.imageBackgrounds.map({ _ in Color.green
                            })*/
                            
                            self.imageBackgrounds[0] = Color.green
                            self.imageBackgrounds[1] = Color.green
                            self.imageBackgrounds[2] = Color.green
                            
                        }
                        
                        
                        if self.cardNumber[3]==self.cardNumber[4] && self.cardNumber[4]==self.cardNumber[5]{
                            
                            self.credits += self.bet * 10
                            
                           /* self.imageBackgrounds = self.imageBackgrounds.map({ _ in Color.green
                            })*/
                            
                            self.imageBackgrounds[3] = Color.green
                            self.imageBackgrounds[4] = Color.green
                            self.imageBackgrounds[5] = Color.green
                            
                        }
                        
                        if self.cardNumber[6]==self.cardNumber[7] && self.cardNumber[7]==self.cardNumber[8]{
                            
                            self.credits += self.bet * 10
                            
                           /* self.imageBackgrounds = self.imageBackgrounds.map({ _ in Color.green
                            })*/
                            
                            self.imageBackgrounds[6] = Color.green
                            self.imageBackgrounds[7] = Color.green
                            self.imageBackgrounds[8] = Color.green
                            
                        }
                        
                        
                        if self.cardNumber[0]==self.cardNumber[4] && self.cardNumber[4]==self.cardNumber[8]{
                            
                            self.credits += self.bet * 30
                            
                           /* self.imageBackgrounds = self.imageBackgrounds.map({ _ in Color.green
                            })*/
                            
                            self.imageBackgrounds[0] = Color.green
                            self.imageBackgrounds[4] = Color.green
                            self.imageBackgrounds[8] = Color.green
                            
                        }
                        
                        if self.cardNumber[2]==self.cardNumber[4] && self.cardNumber[4]==self.cardNumber[6]{
                            
                            self.credits += self.bet * 30
                            
                           /* self.imageBackgrounds = self.imageBackgrounds.map({ _ in Color.green
                            })*/
                            
                            self.imageBackgrounds[2] = Color.green
                            self.imageBackgrounds[4] = Color.green
                            self.imageBackgrounds[6] = Color.green
                            
                        }
                    
                        let allTheElementsAreSame = self.cardNumber.dropFirst().allSatisfy({ $0 == self.cardNumber.first })
                        
                        if allTheElementsAreSame{
                            
                            self.credits += self.bet * 50
                            
                           /* self.imageBackgrounds = self.imageBackgrounds.map({ _ in Color.green
                            })*/
                            
                            
                             self.imageBackgrounds = self.imageBackgrounds.map({ _ in Color.green
                                                   })
                            
                        }
                        
                        else{
                            self.credits -= self.bet * 4
                        }
                        
                        
                    }) {
                        Text("Spin")
                            .bold()
                            .foregroundColor(Color.white)
                            .padding()
                            .padding([.leading, .trailing], 20)
                            .background(Color.black)
                            .cornerRadius(20)
                    }
                    
                }
                
                
                
                 Spacer()
            }
        }
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
