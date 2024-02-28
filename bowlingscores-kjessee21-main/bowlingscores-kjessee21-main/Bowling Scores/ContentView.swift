//
//  ContentView.swift
//  Bowling Scores
//
//  Created by Kaden Jessee on 5/23/23.
//

import SwiftUI

struct ContentView: View {
    @State private var game1 = ""
    @State private var game2 = ""
    @State private var game3 = ""
    @State private var series = 0
    @State private var average = 0
    @State private var high = 0
    var body: some View {
        VStack {
            HStack{
                Spacer()
                VStack(alignment: .leading){
                    Group{
                        //MARK: Bowling Scores
                        HStack{
                            Spacer()
                            Text("Bowling Scores")
                                .font(.title)
                                .fontWeight(.semibold)
                                .foregroundColor(Color.purple)
                                .multilineTextAlignment(.center)
                            Spacer()
                        }
                        HStack{
                            Text("Game 1")
                                .frame(width: 175.0)
                                .background(/*@START_MENU_TOKEN@*//*@PLACEHOLDER=View@*/Color.yellow/*@END_MENU_TOKEN@*/)
                                .accessibilityLabel("Game 1")
                            Spacer(minLength: 0)
                            TextField("Enter score", text: $game1)
                                .frame(width: 175.0)
                                .background(/*@START_MENU_TOKEN@*//*@PLACEHOLDER=View@*/Color.red/*@END_MENU_TOKEN@*/)
                                .accessibilityLabel("game1")
                                .accessibilityValue(game1.isEmpty ? "No value" : game1)
                        }
                        HStack{
                            Text("Game 2")
                                .frame(width: 175.0)
                                .background(/*@START_MENU_TOKEN@*//*@PLACEHOLDER=View@*/Color.yellow/*@END_MENU_TOKEN@*/)
                                .accessibilityLabel("Game 2")
                            Spacer(minLength: 0)
                            TextField("Enter score", text: $game2)
                                .frame(width: 175.0)
                                .background(/*@START_MENU_TOKEN@*//*@PLACEHOLDER=View@*/Color.red/*@END_MENU_TOKEN@*/)
                                .accessibilityLabel("game2")
                                .accessibilityValue(game2.isEmpty ? "No value" : game2)
                        }
                        .padding(.top, -5.0)
                        HStack{
                            Text("Game 3")
                                .frame(width: 175.0)
                                .background(/*@START_MENU_TOKEN@*//*@PLACEHOLDER=View@*/Color.yellow/*@END_MENU_TOKEN@*/)
                                .accessibilityLabel("Game 3")
                            Spacer(minLength: 0)
                            TextField("Enter score", text: $game3)
                                .frame(width: 175.0)
                                .background(/*@START_MENU_TOKEN@*//*@PLACEHOLDER=View@*/Color.red/*@END_MENU_TOKEN@*/)
                                .accessibilityLabel("game3")
                                .accessibilityValue(game3.isEmpty ? "No value" : game3)
                        }
                        .padding(.top, -5.0)
                        //MARK: Calculate
                        HStack{
                            Spacer()
                            Button(action:{
                                //calculate
                                calculateScore()
                            }){
                                
                                Text("Calculate")
                                    .frame(maxWidth: .infinity)
                                    .cornerRadius(10)
                            }
                            .accessibilityLabel("calculate")
                            Spacer()
                        }
                        .padding(.vertical)
                        .background(/*@START_MENU_TOKEN@*//*@PLACEHOLDER=View@*/Color.gray/*@END_MENU_TOKEN@*/)
                        .foregroundColor(/*@START_MENU_TOKEN@*/.white/*@END_MENU_TOKEN@*/)
                        
                        //MARK: Calculations
                        HStack{
                            Text("Series")
                                .frame(width: 175.0)
                                .background(/*@START_MENU_TOKEN@*//*@PLACEHOLDER=View@*/Color.yellow/*@END_MENU_TOKEN@*/)
                                .accessibilityLabel("Series")
                            Spacer(minLength: 0)
                            Text("\(series)")
                                .frame(width: 175.0)
                                .background(/*@START_MENU_TOKEN@*//*@PLACEHOLDER=View@*/Color.blue/*@END_MENU_TOKEN@*/)
                                .accessibilityLabel("series")
                                .accessibilityValue(String(series))
                        }
                        
                        HStack{
                            Text("Average")
                                .frame(width: 175.0)
                                .background(/*@START_MENU_TOKEN@*//*@PLACEHOLDER=View@*/Color.yellow/*@END_MENU_TOKEN@*/)
                                .accessibilityLabel("Average")
                            Spacer(minLength: 0)
                            Text("\(average)")
                                .frame(width: 175.0)
                                .background(/*@START_MENU_TOKEN@*//*@PLACEHOLDER=View@*/Color.blue/*@END_MENU_TOKEN@*/)
                                .accessibilityLabel("average")
                                .accessibilityValue(String(average))
                        }
                        .padding(.top, -5.0)
                        HStack{
                            Text("High")
                                .frame(width: 175.0)
                                .background(/*@START_MENU_TOKEN@*//*@PLACEHOLDER=View@*/Color.yellow/*@END_MENU_TOKEN@*/)
                                .accessibilityLabel("High")
                            Spacer(minLength: 0)
                            Text("\(high)")
                                .frame(width: 175.0)
                                .background(/*@START_MENU_TOKEN@*//*@PLACEHOLDER=View@*/Color.blue/*@END_MENU_TOKEN@*/)
                                .accessibilityLabel("high")
                                .accessibilityValue(String(high))
                        }
                        .padding(.top, -5.0)
                    }
                    Spacer()
                }
                Spacer()
            }
            .padding([.top, .leading])
        }
    }
    
    private func calculateScore(){
        var validScore = [Int]()
        if let game1Score = Int(game1), game1Score != 0{
            validScore.append(game1Score)
        }
        if let game2Score = Int(game2), game2Score != 0{
            validScore.append(game2Score)
        }
        if let game3Score = Int(game3), game3Score != 0{
            validScore.append(game3Score)
        }
        
        if validScore.isEmpty{
            series = 0
            average = 0
            high = 0
        }else{
            series = validScore.reduce(0, +)
            average = series / validScore.count
            high = validScore.max() ?? 0
        }
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
        
    }
}
