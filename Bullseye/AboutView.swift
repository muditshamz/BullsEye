//
//  AboutView.swift
//  Bullseye
//
//  Created by Mudit Sharma on 24/10/20.
//  Copyright © 2020 Mudit Sharma. All rights reserved.
//

import SwiftUI

struct AboutView: View {
    
    struct HeadingView: ViewModifier {
        func body(content: Content) -> some View {
            return content
                .modifier(ColorView())
                .font(Font.custom("Arial Rounded MT Bold", size: 30))
                .padding(.init(top: 20, leading: 0, bottom: 20, trailing: 0))
        }
    }
    struct TextView: ViewModifier {
        func body(content: Content) -> some View {
            return content
                .modifier(ColorView())
                .font(Font.custom("Arial Rounded MT Bold", size: 16))
                .padding(.init(top: 0, leading: 60, bottom: 20, trailing: 60))
        }
    }

    struct ColorView: ViewModifier {
        func body(content: Content) -> some View {
            return content
                .foregroundColor(Color.black)
        }
        
    }
    let mightpink = Color(red: 255.0/255.0, green: 214.0/255.0, blue: 179.0/255.0)
    var body: some View {
        Group{
        VStack{
            Text("🎯 BullsEye 🎯").modifier(HeadingView())
            Text("This is BullsEye, the game where you win points and earn fame by dragging a slider").modifier(TextView()).lineLimit(nil)
            Text("Your goal here is to place the slider as close to the target value.The closer you are more is the points you gain, have a great gaming stressbuster session ahead.").modifier(TextView()).lineLimit(nil)
            Text("Enjoy!").modifier(TextView())
        }
        .background(mightpink)
        .navigationBarTitle("About BullsEye")
        }
        .background(Image("Background"))
    }
}

struct AboutView_Previews: PreviewProvider {
    static var previews: some View {
        AboutView().previewLayout(.fixed(width: 896, height: 414))
    }
}
