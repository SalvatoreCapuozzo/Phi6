//
//  LevelViewController.swift
//  Phi6
//
//  Created by Giovanni Prota on 25/01/17.
//  Copyright © 2017 ITNH. All rights reserved.
//

import UIKit

class LevelViewController: UIViewController, iCarouselDataSource, iCarouselDelegate {
    
    @IBOutlet var levelView: UIView!
    @IBOutlet var pageControl: UIPageControl!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let carousel = iCarousel(frame: levelView.frame)
        carousel.delegate = self
        carousel.dataSource = self
        carousel.type = .linear
        view.addSubview(carousel)
        pageControl.numberOfPages = numberOfItems(in: carousel)
        
    }
    
    @IBAction func backPressed(_ sender: UIButton) {
        self.dismiss(animated: true, completion: nil)
    }
    
    func numberOfItems(in carousel: iCarousel) -> Int {
        return 4
    }
    
    func carousel(_ carousel: iCarousel, viewForItemAt index: Int, reusing view: UIView?) -> UIView {
        let imageView: UIImageView
        
        if view != nil {
            imageView = view as! UIImageView
        } else {
            imageView = UIImageView(frame: CGRect(x: 0, y: 0, width: levelView.frame.width - 160, height: levelView.frame.height))
        }
        
        
        
        imageView.image = UIImage(named: "giovanniprota")
        
        return imageView
    }
    
    func carouselCurrentItemIndexDidChange(_ carousel: iCarousel) {
        pageControl.currentPage = carousel.currentItemIndex
    }
    
}
