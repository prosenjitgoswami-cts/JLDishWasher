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

    /*
     Assign Image URL Strings
     */
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


    /*
     Set Up view
     */
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

    /*
     Add images Up view
     */
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

    /*
     Add Page Control
     */
    func addPageControl() {
        if imageURLStrings.count <= pageControlMaxItems {
            pageControl.numberOfPages = imageURLStrings.count
            pageControl.sizeToFit()
            pageControl.currentPage = 0
            pageControl.translatesAutoresizingMaskIntoConstraints = false
            self.addSubview(pageControl)

            addLayoutConstraint()

            if let pageColor = self.pageColor {
                pageControl.pageIndicatorTintColor = pageColor
            }
            if let currentPageColor = self.currentPageColor {
                pageControl.currentPageIndicatorTintColor = currentPageColor
            }

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

    private func addLayoutConstraint() {
        let widthConstraint = NSLayoutConstraint(item: pageControl, attribute: .width, relatedBy: .equal,
                                                 toItem: nil, attribute: .notAnAttribute, multiplier: 1.0, constant: 250)

        let heightConstraint = NSLayoutConstraint(item: pageControl, attribute: .height, relatedBy: .equal,
                                                  toItem: nil, attribute: .notAnAttribute, multiplier: 1.0, constant: 20)
        let bottomConstraint = NSLayoutConstraint(item: pageControl, attribute: .bottom, relatedBy: .equal,
                                                  toItem: self, attribute: .bottom, multiplier: 1.0, constant: 20)

        let xCenterConstraint = NSLayoutConstraint(item: pageControl, attribute: .centerX, relatedBy: .equal, toItem: self, attribute: .centerX, multiplier: 1, constant: 0)

        NSLayoutConstraint.activate([widthConstraint, heightConstraint, xCenterConstraint,bottomConstraint])
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
