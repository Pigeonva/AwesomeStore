//
//  ProfileView.swift
//  AwesomeStore
//
//  Created by Артур Фомин on 25.04.2023.
//

import SwiftUI

struct ProfileView: View {
    
    @ObservedObject var viewModel: ContentViewViewModel
    
    var body: some View {
        ZStack {
            Color("Background")
            VStack {
                VStack {
                    Image(systemName: "person.circle")
                        .resizable()
                        .frame(width: 60, height: 60)
                        .clipShape(Circle())
                    Text("\(viewModel.user.fullName)")
                        .font(.custom("Montserrat-semibold", size: 20))
                        .padding(20)
                }
                VStack(spacing: 30) {
                    Button {
                        //
                    } label: {
                        HStack(spacing: 10) {
                            Image(systemName: "creditcard")
                                .foregroundColor(Color("TextColor"))
                            Text("Payment method")
                                .font(.custom("Montserrat", size: 15))
                                .foregroundColor(Color("TextColor"))
                            Spacer()
                            Image(systemName: "chevron.right")
                                .foregroundColor(Color("TextColor"))
                        }
                        .padding(.horizontal, 50)
                    }
                    HStack(spacing: 10) {
                        Image(systemName: "person.text.rectangle")
                            .foregroundColor(Color("TextColor"))
                        Text("My balance: \(String(format: "%.1f", viewModel.balance))$")
                            .font(.custom("Montserrat", size: 15))
                            .foregroundColor(Color("TextColor"))
                        Spacer()
                    }
                    .padding(.horizontal, 50)
                    Button {
                        //
                    } label: {
                        HStack(spacing: 10) {
                            Image(systemName: "clock")
                                .foregroundColor(Color("TextColor"))
                            Text("Payment history")
                                .font(.custom("Montserrat", size: 15))
                                .foregroundColor(Color("TextColor"))
                            Spacer()
                            Image(systemName: "chevron.right")
                                .foregroundColor(Color("TextColor"))
                        }
                        .padding(.horizontal, 50)
                    }
                    Button {
                        //
                    } label: {
                        HStack(spacing: 10) {
                            Image(systemName: "arrow.triangle.2.circlepath")
                                .foregroundColor(Color("TextColor"))
                            Text("Restore purchase")
                                .font(.custom("Montserrat", size: 15))
                                .foregroundColor(Color("TextColor"))
                            Spacer()
                            Image(systemName: "chevron.right")
                                .foregroundColor(Color("TextColor"))
                        }
                        .padding(.horizontal, 50)
                    }
                    Button {
                        //
                    } label: {
                        HStack(spacing: 10) {
                            Image(systemName: "questionmark.circle")
                                .foregroundColor(Color("TextColor"))
                            Text("Help")
                                .font(.custom("Montserrat", size: 15))
                                .foregroundColor(Color("TextColor"))
                            Spacer()
                            Image(systemName: "chevron.right")
                                .foregroundColor(Color("TextColor"))
                        }
                        .padding(.horizontal, 50)
                    }
                    Button {
                        viewModel.goToRoot = false
                    } label: {
                        HStack(spacing: 10) {
                            Image(systemName: "door.right.hand.open")
                                .foregroundColor(Color("TextColor"))
                            Text("Log out")
                                .font(.custom("Montserrat", size: 15))
                                .foregroundColor(Color("TextColor"))
                            Spacer()
                            Image(systemName: "chevron.right")
                                .foregroundColor(Color("TextColor"))
                        }
                        .padding(.horizontal, 50)
                    }
                }
                .padding(.top, 30)
            }
            .padding(.bottom, 100)
        }
        .ignoresSafeArea()
    }
}
