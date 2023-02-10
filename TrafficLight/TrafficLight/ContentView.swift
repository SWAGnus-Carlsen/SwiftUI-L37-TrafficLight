//
//  ContentView.swift
//  TrafficLight
//
//  Created by Vitaliy Halai on 10.02.23.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        ZStack{
            Color(.black).ignoresSafeArea()
            VStack {
                Color(.systemRed).frame(width: 150, height: 150)
                    .overlay(Circle().stroke(Color .white, lineWidth:10))
                    .clipShape(Circle())
                Color(.systemYellow)
                    .frame(width: 150, height: 150)
                    .overlay(Circle().stroke(Color .white, lineWidth:10))
                    .clipShape(Circle())
                Color(.systemGreen)
                    .frame(width: 150, height: 150)
                    .overlay(Circle().stroke(Color .white, lineWidth:10))
                    .clipShape(Circle())
                Spacer()
                Button("START"){
                    
                }.frame(width: 200, height: 100)
                    .overlay(Rectangle().stroke(Color .white, lineWidth:10).cornerRadius(5))
                    .foregroundColor(Color.white)
                    .background(Color.blue)
                    .cornerRadius(50)
                    
                    
                
                
            }
            .padding()
        }
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
