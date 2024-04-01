//
//  SplashView.swift
//  ZigZag
//
//  Created by Navodya Weerasooriya on 2024-03-31.
//

import SwiftUI

struct SplashView: View {
    @State private var isNextIconTapped = false
    
    var body: some View {
        ZStack{
            Spacer()
            VStack{
                Spacer()
                VStack{
                    Text("ZigZag")
                        .font(.system(size: 60, weight: .semibold))
                        .foregroundColor(.white)
                    Text("Women's clothing store")
                        .font(.system(size: 15, weight: .medium))
                        .foregroundColor(.white)
                        .opacity(0.7)
                    Button(action: {
                        self.isNextIconTapped = true
                    }, label: {
                        VStack{
                            Text("Shop Now")
                                .fontWeight(.bold)
                                .foregroundColor(.black)
                        }
                        .padding(.horizontal, 30)
                        .padding(.vertical,10)
                        .background(Color.white)
                        .cornerRadius(30)
                        .padding()
                    })
                    
                }
                .padding(.top)
                
                Spacer()
                VStack{
                    Image("SplashImage")
                        .resizable()
                        .scaledToFit()
                        .frame(height: 430)
                }
            }
        }
        .frame(maxWidth: .infinity , maxHeight: .infinity)
        .background(Color("SplashBlue"))
        .ignoresSafeArea()
    }
}



#Preview {
    SplashView()
}
