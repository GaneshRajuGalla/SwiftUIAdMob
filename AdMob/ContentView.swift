//
//  ContentView.swift
//  AdMob
//
//  Created by Ganesh on 09/09/23.
//

import SwiftUI

struct ContentView: View {
    
    // Properties
    @StateObject private var rewardManager = RewardAdsManager()
    
    
    // Body
    var body: some View {
        ZStack{
            Color.black.ignoresSafeArea()
            
            VStack(spacing: 20){
                
                Image("admob")
                    .resizable()
                    .scaledToFill()
                    .frame(height: 200)
                
                Button {
                    rewardManager.displayReward()
                } label: {
                    Text("Show Reward")
                        .font(.headline)
                        .foregroundColor(.white)
                        .fontWeight(.bold)
                        .padding()
                        .frame(maxWidth: .infinity)
                        .background(.blue.gradient)
                        .cornerRadius(10)
                        .shadow(radius: 10)
                }
                Spacer()
            }
            .padding()
        }
        .onAppear{
            rewardManager.loadReward()
        }
        .disabled(!rewardManager.rewardLoaded)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
