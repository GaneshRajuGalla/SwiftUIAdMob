//
//  BannerAdManager.swift
//  AdMob
//
//  Created by Ganesh on 10/09/23.
//

import Foundation
import GoogleMobileAds
import UIKit
import SwiftUI

struct BannerView: UIViewControllerRepresentable{

    func makeUIViewController(context: Context) -> some UIViewController {
        let viewController = BannerAdViewController()
        return viewController
    }
    
    func updateUIViewController(_ uiViewController: UIViewControllerType, context: Context) {
        
    }
}

class BannerAdViewController:UIViewController, GADBannerViewDelegate{
    var bannerView:GADBannerView?
    let adUnitId = "Banner ad Unit ID"
    
    
    // View Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        loadBannerAd()
    }
    
    override func viewWillTransition(to size: CGSize, with coordinator: UIViewControllerTransitionCoordinator) {
        super.viewWillTransition(to: size, with: coordinator)
        coordinator.animate(alongsideTransition: nil) { [weak self] _ in
            guard let self = self else {return}
            self.loadBannerAd()
        }
    }
    
    private func loadBannerAd(){
        // adding Unit Id
        bannerView = GADBannerView(adSize: GADAdSizeBanner)
        bannerView?.adUnitID = adUnitId
        
        // make this root and set delegate
        bannerView?.delegate = self
        bannerView?.rootViewController = self
        
        // setting banner size
        let bannerWidth = view.frame.size.width
        bannerView?.adSize = GADCurrentOrientationAnchoredAdaptiveBannerAdSizeWithWidth(bannerWidth)
        
        let request = GADRequest()
        request.scene = view.window?.windowScene
        bannerView?.load(request)
        
        setAdView(bannerView!)
    }
    
    func setAdView(_ view: GADBannerView){
        bannerView = view
        self.view.addSubview(bannerView!)
        bannerView?.translatesAutoresizingMaskIntoConstraints = false
        let viewDictionary:[String:Any] = ["_bannerView" : bannerView]
        self.view.addConstraints(
            NSLayoutConstraint.constraints(withVisualFormat: "H:|[_bannerView]|", metrics: nil, views: viewDictionary)
        )
        
        self.view.addConstraints(
            NSLayoutConstraint.constraints(withVisualFormat: "V:|[_bannerView]|", metrics: nil, views: viewDictionary)
        )
    }
}
