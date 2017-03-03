//
//  CustomImageView.swift
//  JLDishWasher
//
//  Created by Prsenjit Goswami on 03/03/17.
//  Copyright © 2017 CTS. All rights reserved.
//
import UIKit

class DefaultCache: NSCache<AnyObject, AnyObject> {

    class var shared :DefaultCache {
        struct Singleton {
            static let instance = DefaultCache()
        }
        return Singleton.instance
    }
}


class CustomImageView: UIImageView {


    var task: URLSessionDownloadTask!
    var session: URLSession!

    var loaderIndicator: UIActivityIndicatorView?

    override func layoutSubviews() {
        super.layoutSubviews()
        loaderIndicator?.center = self.center
    }

    /*
     Load image in image view
     @param urlString
     
     */
    public func loadImage(withURLString urlString: String?) {

        //Create Session
        session = URLSession.shared
        //Create Download Task
        task = URLSessionDownloadTask()
        guard let urlString = urlString else{
            return;
        }

        if let cachedimage = DefaultCache.shared.object(forKey: urlString as AnyObject) {
            // Use cache
            self.image = cachedimage as? UIImage
        } else{
            showLoaderIndicator ()
            let url:URL! = URL(string: urlString)
            task = session.downloadTask(with: url, completionHandler: { (location, response, error) -> Void in
                if let data = try? Data(contentsOf: url){
                    DispatchQueue.main.async(execute: { () -> Void in
                        let downloadedImage:UIImage! = UIImage(data: data)
                        self.image = downloadedImage
                        DefaultCache.shared.setObject(downloadedImage, forKey: urlString as AnyObject)
                        self.removeLoader()
                    })
                }
            })
            task.resume()
        }
    }

    private func showLoaderIndicator(){
        //Create Activity Indicator
        loaderIndicator = UIActivityIndicatorView(activityIndicatorStyle: UIActivityIndicatorViewStyle.gray)
        loaderIndicator?.hidesWhenStopped = false
        self.addSubview(loaderIndicator!)
        loaderIndicator?.isHidden = true
        loaderIndicator?.translatesAutoresizingMaskIntoConstraints = false
        addLayoutConstraint()
        // Start Activity Indicator
        loaderIndicator?.startAnimating()
        loaderIndicator?.isHidden = false

    }

    private func removeLoader() {
        if let loaderIndicator = loaderIndicator {
            loaderIndicator.stopAnimating()
            loaderIndicator.removeFromSuperview()            
        }
    }

    private func addLayoutConstraint() {


        guard  let loaderIndicator = loaderIndicator else {
            return;
        }
//        let widthConstraint = NSLayoutConstraint(item: loaderIndicator as Any, attribute: .width, relatedBy: .equal,
//                                                 toItem: nil, attribute: .notAnAttribute, multiplier: 1.0, constant: 30)
//
//        let heightConstraint = NSLayoutConstraint(item: loaderIndicator as Any, attribute: .height, relatedBy: .equal,
//                                                  toItem: nil, attribute: .notAnAttribute, multiplier: 1.0, constant: 30)

        let xCenterConstraint = NSLayoutConstraint(item: loaderIndicator as Any, attribute: .centerX, relatedBy: .equal, toItem: self, attribute: .centerX, multiplier: 1, constant: 0)

        let yCenterConstraint = NSLayoutConstraint(item: loaderIndicator as Any, attribute: .centerY, relatedBy: .equal, toItem: self, attribute: .centerY, multiplier: 1, constant: 0)
        NSLayoutConstraint.activate([ xCenterConstraint,yCenterConstraint])
    }
    

}

