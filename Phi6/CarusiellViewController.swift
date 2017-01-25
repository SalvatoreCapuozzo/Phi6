//
//  CarusiellViewController.swift
//  Phi6
//
//  Created by Armando Ariemma on 24/01/2017.
//  Copyright © 2017 ITNH. All rights reserved.
//

import UIKit

class CarusiellViewController: UIViewController, iCarouselDataSource, iCarouselDelegate {

    @IBOutlet weak var CategoryView: UIView!
    @IBOutlet weak var backButton: UIButton!
    
    @IBOutlet weak var pageControl: UIPageControl!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let carousel = iCarousel(frame: CategoryView.frame)
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
            imageView = UIImageView(frame: CGRect(x: 0, y: 0, width: CategoryView.frame.width - 160, height: CategoryView.frame.height))
        }
        
        
        
        imageView.image = UIImage(named: "giovanniprota")
        
        return imageView
    }
    
    func carouselCurrentItemIndexDidChange(_ carousel: iCarousel) {
        pageControl.currentPage = carousel.currentItemIndex
    }
    
    func carousel(_ carousel: iCarousel, didSelectItemAt index: Int) {
        self.performSegue(withIdentifier: "categorySelected", sender: carousel)
    }
}
