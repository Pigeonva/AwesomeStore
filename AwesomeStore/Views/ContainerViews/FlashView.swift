//
//  FlashView.swift
//  AwesomeStore
//
//  Created by Артур Фомин on 25.04.2023.
//

import SwiftUI

struct FlashView: View {
    var body: some View {
        ZStack {
            Image(systemName: "clock")
                .resizable()
                .foregroundColor(.clear)
                .frame(width: 200, height: 250)
                .background(.yellow)
                .cornerRadius(20)
            HStack {
                VStack {
                    Spacer()
                    Text("Games")
                        .padding(5)
                        .background(.gray)
                        .clipShape(Capsule())
                        .font(.custom("Montserrat", size: 12))
                    Text("Name")
                        .font(.custom("Montserrat", size: 12))
                    Text("1000$")
                        .font(.custom("Montserrat", size: 12))
                        .padding(.top, 8)
                }
                Spacer()
                VStack {
                    Spacer()
                    HStack(spacing: 10) {
                        Button {
                            //
                        } label: {
                            Image(systemName: "heart")
                                .foregroundColor(.black)
                        }
                        Button {
                            //
                        } label: {
                            Image(systemName: "plus.circle")
                                .foregroundColor(.black)
                        }
                    }
                }
                
            }
            .padding(.horizontal, 5)
            .padding(.bottom, 10)
        }
        .frame(width: 200, height: 250)
    }
}


