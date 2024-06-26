//
//  SignInView.swift
//  ZigZag
//
//  Created by Navodya Weerasooriya on 2024-04-07.
//

import SwiftUI

struct SignInView: View {
    @State private var userId : String = ""
    @State private var password : String = ""
    @State private var navigateHome : Bool =  false
    @State private var navigateRegister : Bool =  false
    var loginAction: (Bool) -> Void

    var body: some View {
        NavigationStack{
            ZStack{
                Spacer()
                
                NavigationLink(destination: ContentView(), isActive: $navigateHome) {
                    EmptyView()
                }
                .hidden()
                
                NavigationLink(destination: RegisterView(), isActive: $navigateRegister) {
                    EmptyView()
                }
                .hidden()
                
                VStack{
                    Spacer()
                    VStack{
                        Text("zigzag.")
                            .font(.system(size: 60, weight: .semibold))
                            .foregroundColor(.white)
                        Text("Women's clothing store")
                            .font(.system(size: 15, weight: .medium))
                            .foregroundColor(.white)
                            .opacity(0.7)
                        
                        
                    }
                    .padding(.top)
                    VStack{
                        TextField("Username or Email", text: $password)
                            .foregroundColor(.black)
                            .padding()
                            .background(Color.white)
                            .cornerRadius(10)
                        
                        
                        SecureField("Password", text: $userId)
                            .foregroundColor(.black)
                            .padding()
                            .background(Color.white)
                            .cornerRadius(10)
                        
                        HStack{
                            Spacer()
                            Text("Sign In")
                                .foregroundColor(.white)
                                .fontWeight(.semibold)
                                .font(.system(size: 18))
                            Spacer()
                        }
                        .padding()
                        .overlay(
                            RoundedRectangle(cornerRadius: 10)
                                .stroke(Color.white, lineWidth: 2)
                        )
                        .onTapGesture {
                            loginAction(true)

                            navigateHome = true
                            userId =  ""
                            password = ""
                        }
                        
                        
                        HStack{
                            Spacer()
                            Text("Have an Account")
                                .foregroundColor(.white)
                                .fontWeight(.medium)
                                .font(.system(size: 16))
                                .opacity(0.7)
                            Text("Register")
                                .underline()
                                .foregroundColor(.white)
                                .fontWeight(.semibold)
                                .font(.system(size: 16))
                                .onTapGesture {
                                    navigateRegister = true
                                }
                            Spacer()
                        }
                        .padding(.top,10)
                        
                        
                        
                    }
                    .padding(.horizontal)
                    .padding(.top)
                    
                    
                    Spacer()
                    
                }
            }
            .frame(maxWidth: .infinity , maxHeight: .infinity)
            .background(Color("SplashBlue"))
            .ignoresSafeArea()
            
        }
        .navigationBarBackButtonHidden(true)
    }
    
}



#Preview {
    SignInView(loginAction: {_ in })
}
