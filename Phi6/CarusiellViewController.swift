//
//  CarusiellViewController.swift
//  Phi6
//
//  Created by Armando Ariemma on 24/01/2017.
//  Copyright © 2017 ITNH. All rights reserved.
//

import UIKit

class CarusiellViewController: UIViewController, iCarouselDataSource, iCarouselDelegate {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let carousel = iCarousel(frame: self.view.frame)
        carousel.dataSource = self
        carousel.type = .timeMachine
        view.addSubview(carousel)
        
    }
    
    func numberOfItems(in carousel: iCarousel) -> Int {
        return 10
    }
    
    func carousel(_ carousel: iCarousel, viewForItemAt index: Int, reusing view: UIView?) -> UIView {
        let imageView: UIImageView
        
        if view != nil {
            imageView = view as! UIImageView
        } else {
            imageView = UIImageView(frame: CGRect(x: 0, y: 0, width: 256, height: 256))
        }
        
        imageView.image = UIImage(named: "giovanniprota")
        
        return imageView
    }
}
