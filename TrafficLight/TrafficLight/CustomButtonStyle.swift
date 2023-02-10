//
//  SwiftUIView.swift
//  TrafficLight
//
//  Created by Vitaliy Halai on 10.02.23.
//

import SwiftUI

struct CustomButtonStyle: ButtonStyle {
        func makeBody(configuration: Self.Configuration) -> some View {
                configuration.label
                    .hidden()
                    .frame(width: 200, height: 50)
                    .padding(EdgeInsets(top: 12, leading: 15, bottom: 12, trailing: 15))
                    .cornerRadius(50)
                    .overlay(
                        RoundedRectangle(cornerRadius: 50)
                            .stroke(Color.white, lineWidth: 10)
                    )
                    .overlay(
                        RoundedRectangle(cornerRadius: 50)
                            .fill(Color.blue)
                            .shadow(color: Color.black.opacity(1), radius: 1)
                    )
                    //.opacity(0.7)
                    .overlay(configuration.label)
//                    .padding(.bottom, 100)
//                    .padding(.bottom, 20)
    }
}

struct SwiftUIView: View {
    var body: some View {
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
    }
}

struct SwiftUIView_Previews: PreviewProvider {
    static var previews: some View {
        SwiftUIView()
    }
}
