//
//  ContentView.swift
//  AwesomeStore
//
//  Created by Артур Фомин on 25.04.2023.
//

import SwiftUI

struct ContentView: View {
    
    @State var selected = 0
    
    var body: some View {
        ZStack {
            if selected == 3 {
                ProfileView()
            }
            VStack {
                Spacer()
                HStack {
                    Spacer()
                    Button {
                        self.selected = 0
                    } label: {
                        Image(systemName: "house")
                            .font(.title2)
                            .foregroundColor(self.selected == 0 ? .black : .gray)
                    }
                    Spacer()
                    Button {
                        self.selected = 1
                    } label: {
                        Image(systemName: "heart")
                            .font(.title2)
                            .foregroundColor(self.selected == 1 ? .black : .gray)
                    }
                    Spacer()
                    Button {
                        self.selected = 2
                    } label: {
                        Image(systemName: "cart")
                            .font(.title2)
                            .foregroundColor(self.selected == 2 ? .black : .gray)
                    }
                    Spacer()
                    Button {
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
                .background(Color.white, ignoresSafeAreaEdges: .all)
                .cornerRadius(20)
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
