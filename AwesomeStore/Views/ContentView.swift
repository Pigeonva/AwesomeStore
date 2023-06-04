//
//  ContentView.swift
//  AwesomeStore
//
//  Created by Артур Фомин on 25.04.2023.
//

import SwiftUI

struct ContentView: View {
    
    @ObservedObject var viewModel: ContentViewViewModel
    @Binding var goToRoot: Bool
    
    var body: some View {
        ZStack {
            AnyView(viewModel.currentView)
            
            VStack {
                Spacer()
                HStack {
                    Spacer()
                    Button {
                        viewModel.selected = 0
                    } label: {
                        Image(systemName: "house")
                            .font(.title2)
                            .foregroundColor(viewModel.selected == 0 ? .black : .gray)
                    }
                    Spacer()
                    Button {
                        viewModel.selected = 1
                    } label: {
                        Image(systemName: "heart")
                            .font(.title2)
                            .foregroundColor(viewModel.selected == 1 ? .black : .gray)
                    }
                    Spacer()
                    Button {
                        viewModel.selected = 2
                    } label: {
                        Image(systemName: "cart")
                            .font(.title2)
                            .foregroundColor(viewModel.selected == 2 ? .black : .gray)
                    }
                    Spacer()
                    Button {
                        viewModel.selected = 3
                    } label: {
                        Image(systemName: "person")
                            .font(.title2)
                            .foregroundColor(viewModel.selected == 3 ? .black : .gray)
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
        .navigationBarBackButtonHidden()
    }
}
