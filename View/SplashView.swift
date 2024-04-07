//
//  SplashView.swift
//  ZigZag
//
//  Created by Navodya Weerasooriya on 2024-03-31.
//

import SwiftUI

struct SplashView: View {
    
    var body: some View {
 
            ZStack{
                Spacer()
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
