//
//  RegisterView.swift
//  ZigZag
//
//  Created by Navodya Weerasooriya on 2024-04-07.
//

import SwiftUI

struct RegisterView: View {
    @State private var userId : String = ""
    @State private var password : String = ""
    @State private var navigateSign : Bool =  false

    var body: some View {
        NavigationStack{
            ZStack{
                Spacer()
                
            
                .hidden()
                
                NavigationLink(destination: RegisterView(), isActive: $navigateSign) {
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
                        
                        TextField("Phone", text: $password)
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
                            Text("Register Now")
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
                            navigateSign = true
                            userId =  ""
                            password = ""
                        }
                        
                        
                        HStack{
                            Spacer()
                            Text("Do you hace an account?")
                                .foregroundColor(.white)
                                .fontWeight(.medium)
                                .font(.system(size: 16))
                                .opacity(0.7)
                            Text("Sign In")
                                .underline()
                                .foregroundColor(.white)
                                .fontWeight(.semibold)
                                .font(.system(size: 16))
                                .onTapGesture {
                                    navigateSign = true
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
    RegisterView()
}
