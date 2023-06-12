//
//  ProductView.swift
//  AwesomeStore
//
//  Created by Артур Фомин on 11.06.2023.
//

import SwiftUI

struct ProductView: View {
    
    @State var name: String = ""
    @State var price: Double = 0.0
    @State var imageUrl: String = ""
    @State var isLiked: Bool = false
    
    var body: some View {
        VStack {
            AsyncImage(url: URL(string: imageUrl), scale: 1, content: { image in
                image
                    .resizable()
            }, placeholder: {
                Color.blue.opacity(0.5)
            })
            .aspectRatio(contentMode: .fit)
            .frame(width: 150, height: 150)
            .clipShape(RoundedRectangle(cornerRadius: 10))
            HStack {
                Spacer()
                VStack {
                    Spacer()
                    Text("\(name)")
                        .font(.custom("Montserrat-semibold", size: 12))
                        .foregroundColor(.black)
                    Text("\(String(format: "%.1f", price))$")
                        .font(.custom("Montserrat-semibold", size: 12))
                        .foregroundColor(.black)
                }
                Spacer()
                VStack {
                    Spacer()
                    HStack(spacing: 10){
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
            .padding(.horizontal, 2)
            .padding(.bottom, 10)
        }
    }
}


struct ProductView_Previews: PreviewProvider {
    static var previews: some View {
        ProductView()
    }
}
