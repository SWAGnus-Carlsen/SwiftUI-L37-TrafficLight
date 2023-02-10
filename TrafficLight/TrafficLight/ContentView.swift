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
    @State var wasTappedAtLeastOnce = false
    @State var state = TrafficLightState.yellowLight
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
                Button(action: { changeState()}) {
                           HStack {
                               Text(wasTappedAtLeastOnce ? "NEXT STATE" : "START")
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
        wasTappedAtLeastOnce = true
        switch state {
            
        case .redLight:
            state = .redAndYellowLight
        case .redAndYellowLight:
            state = .greenLight
        case .greenLight:
            state = .yellowLight
        case .yellowLight:
            state = .redLight
        }
        switch state {
        case .redLight:
            color1 = UIColor.red.cgColor
            color2 = UIColor.systemGray.cgColor
            color3 = UIColor.systemGray.cgColor
        case .redAndYellowLight:
            color1 = UIColor.red.cgColor
            color2 = UIColor.systemYellow.cgColor
            color3 = UIColor.systemGray.cgColor
        case .greenLight:
            color1 = UIColor.systemGray.cgColor
            color2 = UIColor.systemGray.cgColor
            color3 = UIColor.systemGreen.cgColor
        case .yellowLight:
            color1 = UIColor.systemGray.cgColor
            color2 = UIColor.systemYellow.cgColor
            color3 = UIColor.systemGray.cgColor
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
