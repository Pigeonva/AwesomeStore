//
//  LikeView.swift
//  AwesomeStore
//
//  Created by Артур Фомин on 25.04.2023.
//

import SwiftUI

struct LikeView: View {
    var body: some View {
        HStack {
            Image(systemName: "clock")
                .resizable()
                .foregroundColor(.clear)
                .frame(width: 150, height: 200)
                .background(.yellow)
                .cornerRadius(20)
            VStack {
                Text("Name")
                    .font(.custom("Montserrat", size: 15))
                Text("1000$")
                    .font(.custom("Montserrat", size: 15))
                    .padding(.top, 5)
            }
            Spacer()
            VStack {
                Button {
                    //
                } label: {
                    Image(systemName: "x.circle")
                        .foregroundColor(.black)
                        .font(.largeTitle)
                }
                Spacer()
            }

        }
    }
}

