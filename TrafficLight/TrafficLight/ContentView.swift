//
//  ContentView.swift
//  TrafficLight
//
//  Created by Vitaliy Halai on 10.02.23.
//

import SwiftUI
enum TrafficLightState {
    case redLight
    case redAndYellowLight
    case greenLight
    case yellowLight

}
struct ContentView: View {
    
    @State var color1: CGColor?
    @State var color2: CGColor?
    @State var color3: CGColor?
    @State var currentDate = Date.now
    @State var timer = Timer(timeInterval: 1,  repeats: false){_ in }
    @State var isLaunched: Bool = false
    @State var canStartTimer: Bool = true
    @State var wasTappedAtLeastOnce = false
    @State var labelText = "START"
    @State var state = TrafficLightState.redLight
    var defaultColor = UIColor.systemGray.cgColor
    var body: some View {
        ZStack{
            Color(.black).ignoresSafeArea()
            VStack {
                Color(color1 ?? defaultColor).frame(width: 150, height: 150)
                    .overlay(Circle().stroke(Color .white, lineWidth:10))
                    .clipShape(Circle())
                Color(color2 ?? defaultColor)
                    .frame(width: 150, height: 150)
                    .overlay(Circle().stroke(Color .white, lineWidth:10))
                    .clipShape(Circle())
                Color(color3  ?? defaultColor)
                    .frame(width: 150, height: 150)
                    .overlay(Circle().stroke(Color .white, lineWidth:10))
                    .clipShape(Circle())
                Spacer()
                Button(action:
                        { if labelText == "START"{
                            canStartTimer = true
                            changeState()}
                    else {
                        labelText = "START"
                        isLaunched.toggle()
                        canStartTimer = false
                        timer.invalidate()
                        
                    }
                }) {
                           HStack {
                               Text(labelText)
                                   .font(.custom("Seravek-Bold", size: 25))
                                   .fontWeight(.bold)
                                   .foregroundColor(Color.white)
                           }
                       }
                     
                       .buttonStyle(CustomButtonStyle())
                       
                    
                
                
            }
            .padding()
        }
        
    }
    func changeState() {
        
 
        switch state {
        case .redLight:
            color1 = UIColor.red.cgColor
            color2 = UIColor.systemGray.cgColor
            color3 = UIColor.systemGray.cgColor
            state = .redAndYellowLight
        case .redAndYellowLight:
            color1 = UIColor.red.cgColor
            color2 = UIColor.systemYellow.cgColor
            color3 = UIColor.systemGray.cgColor
            state = .greenLight
        case .greenLight:
            color1 = UIColor.systemGray.cgColor
            color2 = UIColor.systemGray.cgColor
            color3 = UIColor.systemGreen.cgColor
            state = .yellowLight
        case .yellowLight:
            color1 = UIColor.systemGray.cgColor
            color2 = UIColor.systemYellow.cgColor
            color3 = UIColor.systemGray.cgColor
            state = .redLight
        }
        if !isLaunched, canStartTimer{
            isLaunched.toggle()
            labelText = "STOP"
            
            timer = Timer.scheduledTimer(withTimeInterval: 1, repeats: true) { time in
                changeState() }
            
            
            
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
