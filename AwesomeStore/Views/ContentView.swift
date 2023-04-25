//
//  ContentView.swift
//  AwesomeStore
//
//  Created by Артур Фомин on 25.04.2023.
//

import SwiftUI

struct ContentView: View {
    
    @State var selected = 0
    @State var view = "House"
    
    var body: some View {
        VStack {
            Spacer()
            Text("\(view)")
            Spacer()
            HStack {
                Spacer()
                Button {
                    self.view = "House"
                    self.selected = 0
                } label: {
                    Image(systemName: "house")
                        .font(.title2)
                        .foregroundColor(self.selected == 0 ? .black : .gray)
                }
                Spacer()
                Button {
                    self.view = "Favourite"
                    self.selected = 1
                } label: {
                    Image(systemName: "heart")
                        .font(.title2)
                        .foregroundColor(self.selected == 1 ? .black : .gray)
                }
                Spacer()
                Button {
                    self.view = "Cart"
                    self.selected = 2
                } label: {
                    Image(systemName: "cart")
                        .font(.title2)
                        .foregroundColor(self.selected == 2 ? .black : .gray)
                }
                Spacer()
                Button {
                    self.view = "Profile"
                    self.selected = 3
                } label: {
                    Image(systemName: "person")
                        .font(.title2)
                        .foregroundColor(self.selected == 3 ? .black : .gray)
                }
                Spacer()
            }
            .padding(.top, 15)
            .padding(.bottom, 5)
            .frame(height: 63)
            .background(Color.yellow, ignoresSafeAreaEdges: .all)
            .cornerRadius(20)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
