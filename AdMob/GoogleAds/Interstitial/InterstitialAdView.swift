//
//  InterstitialAdView.swift
//  AdMob
//
//  Created by Ganesh on 09/09/23.
//

import SwiftUI

struct InterstitialAdView: View {
    
    // Properties
    @StateObject private var interstitialAdManager = InterstitialAdsManager()
    
    // Body
    var body: some View {
        ZStack{
            Color.black.ignoresSafeArea()
            
            VStack{
                Image("admob")
                    .resizable()
                    .scaledToFill()
                    .frame(height: 200)
                Spacer()
                
                Button {
                    interstitialAdManager.displayInterstitialAd()
                } label: {
                    Text("Show InterstitialAd")
                        .font(.headline)
                        .foregroundColor(.white)
                        .fontWeight(.bold)
                        .frame(maxWidth: .infinity)
                        .padding()
                        .background(.red.gradient)
                        .cornerRadius(10)
                        .shadow(radius: 10)
                        .padding(.horizontal)
                }
                Spacer()
            }
        }
        .onAppear{
            interstitialAdManager.loadInterstitialAd()
        }
        .disabled(!interstitialAdManager.interstitialAdLoaded)
    }
}

struct InterstitialAdView_Previews: PreviewProvider {
    static var previews: some View {
        InterstitialAdView()
    }
}
