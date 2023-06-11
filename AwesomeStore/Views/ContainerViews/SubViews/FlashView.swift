//
//  FlashView.swift
//  AwesomeStore
//
//  Created by Артур Фомин on 25.04.2023.
//

import SwiftUI

struct FlashView: View {
    
    @State var category: String = ""
    @State var name: String = ""
    @State var price: Double = 0.0
    @State var discount: Int = 0
    @State var imageUrl: String = ""
    
    var body: some View {
        VStack {
            AsyncImage(url: URL(string: imageUrl), scale: 1, content: { image in
                image
                    .resizable()
            }, placeholder: {
                Color.blue.opacity(0.5)
            })
            .aspectRatio(contentMode: .fit)
            .frame(width: 200, height: 200)
            .clipShape(RoundedRectangle(cornerRadius: 10))
            VStack {
                Text("\(category)")
                    .padding(5)
                    .background(.blue.opacity(0.5))
                    .clipShape(Capsule())
                    .font(.custom("Montserrat-semibold", size: 12))
                Text("\(name)")
                    .font(.custom("Montserrat-semibold", size: 12))
                Text("\(String(format: "%.1f", price))$")
                    .font(.custom("Montserrat-semibold", size: 12))
            }
            HStack {
                Text("-\(discount)%")
                    .padding(5)
                    .background(.red.opacity(0.5))
                    .clipShape(Capsule())
                    .font(.custom("Montserrat-semibold", size: 12))
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
                }}
        }
        .padding(.horizontal, 20)
    }
}


