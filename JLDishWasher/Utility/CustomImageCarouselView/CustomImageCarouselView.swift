//
//  CustomImageCarouselView.swift
//  JLDishWasher
//
//  Created by Prsenjit Goswami on 03/03/17.
//  Copyright © 2017 CTS. All rights reserved.
//

import UIKit

protocol CustomImageCarouselViewDelegate {
    func scrolledToPage(_ page: Int)
}

@IBDesignable
class CustomImageCarouselView: UIView {

    var delegate: CustomImageCarouselViewDelegate?

    @IBInspectable var showPageControl: Bool = false {
        didSet {
            setupView()
        }
    }

    @IBInspectable var pageControlMaxItems: Int = 20 {
        didSet {
            setupView()
        }
    }

    var carouselScrollView: UIScrollView!

    var imageURLStrings = [String]() {
        didSet {
            setupView()
        }
    }

    var pageControl = UIPageControl()

    var currentPage: Int! {
        return Int(round(carouselScrollView.contentOffset.x / self.bounds.width))
    }

    @IBInspectable var pageColor: UIColor? {
        didSet {
            setupView()
        }
    }

    @IBInspectable var currentPageColor: UIColor? {
        didSet {
            setupView()
        }
    }

    func setupView() {
        for view in subviews {
            view.removeFromSuperview()
        }

        carouselScrollView = UIScrollView(frame: bounds)
        carouselScrollView.showsHorizontalScrollIndicator = false

        addImages()

        if showPageControl {
            addPageControl()
            carouselScrollView.delegate = self
        }
    }

    func addImages() {
        carouselScrollView.isPagingEnabled = true
        carouselScrollView.contentSize = CGSize(width: bounds.width * CGFloat(imageURLStrings.count), height: bounds.height)

        for i in 0..<imageURLStrings.count {

            let utlString =  imageURLStrings[i]
            let imageView = CustomImageView(frame: CGRect(x: bounds.width * CGFloat(i), y: 0, width: bounds.width, height: bounds.height))
            imageView.loadImage(withURLString: utlString)
            imageView.contentMode = .scaleAspectFill
            imageView.layer.masksToBounds = true
            imageView.isUserInteractionEnabled = true
            carouselScrollView.addSubview(imageView)
        }

        self.addSubview(carouselScrollView)
    }

    func addPageControl() {
        if imageURLStrings.count <= pageControlMaxItems {
            pageControl.numberOfPages = imageURLStrings.count
            pageControl.sizeToFit()
            pageControl.currentPage = 0
            pageControl.center = CGPoint(x: self.center.x, y: bounds.height - pageControl.bounds.height/2 - 8)

            if let pageColor = self.pageColor {
                pageControl.pageIndicatorTintColor = pageColor
            }
            if let currentPageColor = self.currentPageColor {
                pageControl.currentPageIndicatorTintColor = currentPageColor
            }

            self.addSubview(pageControl)
        }
    }

    override func awakeFromNib() {
        super.awakeFromNib()

        setupView()
    }

    override func prepareForInterfaceBuilder() {
        super.prepareForInterfaceBuilder()

        setupView()
    }

    override func layoutSubviews() {
        super.layoutSubviews()

        setupView()
    }

}

extension CustomImageCarouselView: UIScrollViewDelegate {

    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        self.pageControl.currentPage = self.currentPage
    }
    
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        self.delegate?.scrolledToPage(self.currentPage)
    }
    
}
