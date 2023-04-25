//
//  ProfileView.swift
//  AwesomeStore
//
//  Created by Артур Фомин on 25.04.2023.
//

import SwiftUI

struct ProfileView: View {
    var body: some View {
        ZStack {
            Color("Background")
            VStack {
                VStack {
                    Image(systemName: "person.circle")
                        .resizable()
                        .frame(width: 60, height: 60)
                        .clipShape(Circle())
                    Button {
                        //
                    } label: {
                        Text("Change photo")
                            .foregroundColor(.gray)
                            .font(.custom("Montserrat", size: 10))
                    }
                    .padding(10)
                    Text("Full Name")
                        .font(.custom("Montserrat-semibold", size: 20))
                        .padding(20)
                }
                VStack(spacing: 30) {
                    Button {
                        //
                    } label: {
                        HStack(spacing: 10) {
                            Image(systemName: "creditcard")
                                .foregroundColor(.black)
                            Text("Payment method")
                                .font(.custom("Montserrat", size: 15))
                                .foregroundColor(.black)
                            Spacer()
                            Image(systemName: "chevron.right")
                                .foregroundColor(.black)
                        }
                        .padding(.horizontal, 50)
                    }
                    Button {
                        //
                    } label: {
                        HStack(spacing: 10) {
                            Image(systemName: "creditcard")
                                .foregroundColor(.black)
                            Text("Cashback")
                                .font(.custom("Montserrat", size: 15))
                                .foregroundColor(.black)
                            Spacer()
                            Image(systemName: "chevron.right")
                                .foregroundColor(.black)
                        }
                        .padding(.horizontal, 50)
                    }
                    Button {
                        //
                    } label: {
                        HStack(spacing: 10) {
                            Image(systemName: "clock")
                                .foregroundColor(.black)
                            Text("Payment history")
                                .font(.custom("Montserrat", size: 15))
                                .foregroundColor(.black)
                            Spacer()
                            Image(systemName: "chevron.right")
                                .foregroundColor(.black)
                        }
                        .padding(.horizontal, 50)
                    }
                    Button {
                        //
                    } label: {
                        HStack(spacing: 10) {
                            Image(systemName: "arrow.triangle.2.circlepath")
                                .foregroundColor(.black)
                            Text("Restore purchase")
                                .font(.custom("Montserrat", size: 15))
                                .foregroundColor(.black)
                            Spacer()
                            Image(systemName: "chevron.right")
                                .foregroundColor(.black)
                        }
                        .padding(.horizontal, 50)
                    }
                    Button {
                        //
                    } label: {
                        HStack(spacing: 10) {
                            Image(systemName: "questionmark.circle")
                                .foregroundColor(.black)
                            Text("Help")
                                .font(.custom("Montserrat", size: 15))
                                .foregroundColor(.black)
                            Spacer()
                            Image(systemName: "chevron.right")
                                .foregroundColor(.black)
                        }
                        .padding(.horizontal, 50)
                    }
                    Button {
                        //
                    } label: {
                        HStack(spacing: 10) {
                            Image(systemName: "door.right.hand.open")
                                .foregroundColor(.black)
                            Text("Log out")
                                .font(.custom("Montserrat", size: 15))
                                .foregroundColor(.black)
                            Spacer()
                            Image(systemName: "chevron.right")
                                .foregroundColor(.black)
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

struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileView()
    }
}
