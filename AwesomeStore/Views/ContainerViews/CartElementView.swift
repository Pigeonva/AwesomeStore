//
//  CartElementView.swift
//  AwesomeStore
//
//  Created by Артур Фомин on 26.04.2023.
//

import SwiftUI

struct CartElementView: View {
    var body: some View {
        HStack(spacing: 15) {
            Image(systemName: "clock")
                .resizable()
                .foregroundColor(.clear)
                .frame(width: 150, height: 200)
                .background(.yellow)
                .cornerRadius(20)
            VStack {
                HStack {
                    Spacer()
                    Button {
                        //
                    } label: {
                        Image(systemName: "x.circle")
                            .foregroundColor(.black)
                            .font(.title)
                    }
                }
                .padding(.bottom, 50)
                HStack(spacing: 5) {
                    Spacer()
                    Text("2")
                    Spacer()
                    Button {
                        //
                    } label: {
                        Text("-")
                            .frame(width: 30, height: 20)
                            .background(.gray)
                            .foregroundColor(.black)
                            .font(.title)
                    }
                    Button {
                        //
                    } label: {
                        Text("+")
                            .frame(width: 30, height: 20)
                            .background(.gray)
                            .foregroundColor(.black)
                            .font(.title)
                    }
                    Text("1000$")
                        .font(.custom("Montserrat", size: 15))
                        .padding(.leading, 20)
                }
            }
        }
        .padding(.horizontal, 20)
    }
}


