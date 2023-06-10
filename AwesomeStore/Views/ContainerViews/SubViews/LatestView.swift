//
//  LatestView.swift
//  AwesomeStore
//
//  Created by Артур Фомин on 25.04.2023.
//

import SwiftUI

struct LatestView: View {
    
    @State var category: String = ""
    @State var name: String = ""
    @State var price: Int = 0
    @State var imageUrl: String = ""
    
    var body: some View {
        VStack {
            AsyncImage(url: URL(string: imageUrl), scale: 1, content: { image in
                image
                    .resizable()
            }, placeholder: {
                Color.yellow
            })
            .aspectRatio(contentMode: .fill)
            .frame(width: 100, height: 150)
            .clipShape(RoundedRectangle(cornerRadius: 10))
            HStack {
                VStack {
                    Spacer()
                    Text("\(category)")
                        .padding(5)
                        .background(.blue.opacity(0.5))
                        .clipShape(Capsule())
                        .font(.custom("Montserrat-semibold", size: 12))
                        .foregroundColor(.black)
                    Text("\(name)")
                        .font(.custom("Montserrat-semibold", size: 12))
                        .foregroundColor(.black)
                    Text("\(price)$")
                        .font(.custom("Montserrat-semibold", size: 12))
                        .foregroundColor(.black)
                }
                Spacer()
                VStack {
                    Spacer()
                    Button {
                        //
                    } label: {
                        Image(systemName: "plus.circle")
                            .foregroundColor(.black)
                    }
                }
                
            }
            .padding(.horizontal, 2)
            .padding(.bottom, 10)
        }
        .frame(width: 150, height: 250)
    }
}
