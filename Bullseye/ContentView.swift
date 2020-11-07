//
//  ContentView.swift
//  Bullseye
//
//  Created by Mudit Sharma on 25/07/20.
//  Copyright © 2020 Mudit Sharma. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    
    
    
    
    struct LabelStyle: ViewModifier {
        func body(content: Content) -> some View {
            return content
                .foregroundColor(Color.white)
                .modifier(Shadow())
                .font(Font.custom("GillSans-BoldItalic ", size: 18))
        }
    }
    struct ValueStyle: ViewModifier {
        func body(content: Content) -> some View {
            return content
                .foregroundColor(Color.yellow)
                .modifier(Shadow())
                .font(Font.custom("Arial Rounded MT BOLD ", size: 24))
        }
    }
    
    struct Shadow: ViewModifier {
        func body(content: Content) -> some View {
            return content
               .shadow(color: /*@START_MENU_TOKEN@*/.black/*@END_MENU_TOKEN@*/, radius: /*@START_MENU_TOKEN@*/10/*@END_MENU_TOKEN@*/, x: 2, y: 2)
                
        }
    }
    struct ButtonLargeStyle: ViewModifier {
        func body(content: Content) -> some View {
            return content
                .foregroundColor(Color.black)
                .font(Font.custom("AppleSDGothicNeo-Bold", size: 18))
        }
    }
    
    struct ButtonSmallStyle: ViewModifier {
        func body(content: Content) -> some View {
            return content
                .foregroundColor(Color.black)
                .font(Font.custom("AppleSDGothicNeo-Bold", size: 12))
        }
    }
    //TypeInferenced
    @State var alertIsVisible = false
    //Not Type Inferenced
    @State var sliderValue: Double=50.0
    @State var targetValue = Int.random(in: 1...100)
    @State var score=0
    @State var round=1
    let mightnightblue = Color(red: 0/255.0, green: 51.0/255.0, blue: 102.0/255.0)
        var body: some View {
        VStack {
            Spacer()
            // Target Row
            HStack{
                Text("Put the bullseye, as close as you can to:").modifier(LabelStyle())
                Text("\(targetValue)").modifier(ValueStyle())
                    
            }
            Spacer()
            // Slider Row
            HStack{
                Text("1").modifier(LabelStyle())
                Slider(value: self.$sliderValue, in: 1...100).accentColor(Color.green)
                Text("100").modifier(LabelStyle())
            }
            
            Spacer()
            // Button Row
                Button(action: {
                    print("Button Pressed!")
                    alertIsVisible=true
                   
                }) {
                    Text("Hit Me").modifier(ButtonLargeStyle())
                }
                .alert(isPresented: $alertIsVisible) { () ->
                    Alert in
                   // let roundedValue = Int(sliderValue.rounded())
                    
                    return Alert(title: Text("\(alertValue())"), message: Text("The Slider Value is \(roundedValue()).\n" +
                        "You scored \(currentRoundScore()) points in this round."
                    ), dismissButton: .default(Text("Awesome")){
                        self.score=self.score+self.currentRoundScore()
                        self.targetValue=Int.random(in: 1...100)
                        self.round+=1
                    })
                    
                }
                .background(Image("Button"), alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/).modifier(Shadow())
            Spacer()
            // Score Row
            HStack{
                Button(action: {
                    resetbutton()
                }) {
                    HStack{
                        Image("StartOverIcon")
                    Text("Start Over").modifier(ButtonSmallStyle())
                    }
                    
                }
                .background(Image("Button"), alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/).modifier(Shadow())
                Spacer()
                Text("Score:").modifier(LabelStyle())
                Text("\(score)").modifier(ValueStyle())
                Spacer()
                Text("Round:").modifier(LabelStyle())
                Text("\(round)").modifier(ValueStyle())
                Spacer()
                NavigationLink(destination: AboutView()) {
                    HStack{
                        Image("InfoIcon")
                        Text("Info").modifier(ButtonSmallStyle())
                    }
                    
                }
                .background(Image("Button"), alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/).modifier(Shadow())
            }
            .padding(.bottom, 20)
            }
        .background(Image("Background"), alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
        .accentColor(mightnightblue)
        .navigationBarTitle("BullsEye")
        }
    func roundedValue() -> Int {
        Int(sliderValue.rounded())
    }
    func amountOff() -> Int {
        abs(roundedValue()-targetValue)
    }
    func currentRoundScore() -> Int {
        let score = 100 - amountOff()
        if amountOff()==0 {
            return score+100
        }else if amountOff()==1{
            return score+50
        }else{
            return score
        }
        /*if (difference)<0 {
            difference=difference*(-1)
            // or difference*=-1
        }*/
        
    }
    func alertValue() -> String {
       let diff = amountOff()
        if diff==0 {
            return "Perfect!!!"
        }else if diff<5{
            return "Almost had that!"
        }else{
            return "Hey! you went to Central Park, for some fresh air?"
        }
    }
    func resetbutton() -> Void {
            score=0
            round=1
            sliderValue=50.0
            targetValue=Int.random(in: 1...100)
        
        
    }
    }


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
    ContentView().previewLayout(.fixed(width: 896, height: 414))    }
}
