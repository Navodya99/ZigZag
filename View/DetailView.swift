//
//  DetailView.swift
//  ZigZag
//
//  Created by Navodya Weerasooriya on 2024-04-02.
//

import SwiftUI

struct DetailView: View {
    var body: some View {
        VStack{
            VStack(alignment: .leading){
                ZStack{
                    Image("f1")
                        .resizable()
                        .scaledToFit()
                }
                HStack{
                    Spacer()
                    Text("SIZE M")
                        .padding(.trailing,20)
                        .foregroundStyle(Color.white)
                        .fontWeight(.semibold)
                        .frame(height: 36)
                        .padding(.horizontal)
                        .background(Color("SplashBlue"))
                        .cornerRadius(20)
                        .padding(.top, -28)
                        .padding(.trailing,-20)

                    
                }
                
                Text("Product Name Product Name Product Name ")
                    .font(.title)
                    .padding(.horizontal,10)
                Text("Product Description Product Description Product Description Product Description Product Description Product Description ")
                    .font(.system(size: 15))
                    .padding(.horizontal,10)
                    .opacity(0.7)
                
                
                
                   
                
                
                
            }
            Spacer()
            VStack{
                HStack{
                    Text("ADD TO CART")
                        .fontWeight(.medium)
                    Spacer()
                    Text("LKR 7878")
                        .fontWeight(.medium)
                        .opacity(0.8)
                }
                .padding()
                .foregroundColor(.white)
                .background(Color("AppBlack"))
                .cornerRadius(5)
                .padding()
            }
        }
    }
}

#Preview {
    DetailView()
}
