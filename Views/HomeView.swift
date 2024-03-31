//
//  HomeView.swift
//  ZigZag
//
//  Created by Navodya Weerasooriya on 2024-03-31.
//

import SwiftUI

struct HomeView: View {
    var body: some View {
        ZStack{
            VStack{
                HeaderView()
                CoupenView()
                Spacer()
            }
           
        }
    }
}


struct HeaderView : View {
    var body: some View{
        VStack{
            HStack(alignment: .center)
            {
                Image(systemName: "magnifyingglass").hidden()
                Spacer()
                
                Text("zigzag.")
                    .font(.system(size: 25 , weight: .semibold))
                Spacer()
                Image(systemName: "magnifyingglass")
                    .fontWeight(.medium)
                    .font(.system(size: 20))
                    .opacity(0.5)
                    .padding(.top,3)
            }
        }
        .padding(.horizontal,30)
        .padding(.vertical,10)
    }
}


struct CoupenView : View {
    var body: some View{
        VStack(spacing : 5){
            Text("FOR ALIMITED TIME")
                .font(.system(size: 15))
                .opacity(0.8)
            Text("ENJOY AN EXTRA 20% OFF SALE")
                .font(.system(size: 18))
                .fontWeight(.semibold)
            Text("WITH CODE: TWSUMMER")
                .font(.system(size: 15))

        }
        .padding(10)
        .multilineTextAlignment(.center)
        .frame(maxWidth: .infinity)
        .background(Color("CoupenColor"))
        
        
    }
}

#Preview {
    HomeView()
}
