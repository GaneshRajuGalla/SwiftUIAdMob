//
//  BannerAdView.swift
//  AdMob
//
//  Created by Ganesh on 10/09/23.
//

import SwiftUI

struct BannerAdView: View {
    var body: some View {
        ZStack{
            Color.black.ignoresSafeArea()
            VStack{
                BannerView()
                    .frame(height: 60)
                Spacer()
            }
            
        }
    }
}

struct BannerAdView_Previews: PreviewProvider {
    static var previews: some View {
        BannerAdView()
    }
}
