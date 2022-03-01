//
//  ContentView.swift
//  Bullseye with SwiftUI
//
//  Created by Tony Hong on 2/17/22.
//

import SwiftUI

struct ContentView: View {
    @State var sliderValue: Double = 25
    @State private var isToggle : Bool = false
    var body: some View {

        
        VStack() {
            HStack() {
                VStack() {
                    Text("High Score")
                    Text("0")

                }.padding()


                
                VStack() {
                    Text("Current Level")
                    Text("1")
                }.padding(.leading, 130)

            }.padding(.bottom, 180)
                

            
            VStack() {
                Text("Move the slider to:").font(.system(size: 30))
                    .padding(.bottom,10)
                Text("25").font(.system(size: 30))
                Slider(value: $sliderValue, in: 0...50)
                Button(action:  {
                    print($sliderValue)
                }) {
                    Text("Check")
                }
                .padding(.bottom, 200)
                
                VStack {
                    Text("Exact Mode?")
                    HStack {
                        Spacer()
                            .padding()
                        Toggle(isOn: $isToggle){
                        }
                        Spacer()
                            .padding(.leading, 130)
                    }
                }.padding()

            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
