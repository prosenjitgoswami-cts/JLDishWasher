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
        // Position Activity Indicator in the center of the main view
        loaderIndicator?.center = self.center
        // If needed, you can prevent Acivity Indicator from hiding when stopAnimating() is called
        loaderIndicator?.hidesWhenStopped = false
        // Start Activity Indicator
        loaderIndicator?.startAnimating()
        self.addSubview(loaderIndicator!)
        self.bringSubview(toFront: self)
    }

    private func removeLoader() {
        if let loaderIndicator = loaderIndicator {
            loaderIndicator.stopAnimating()
            loaderIndicator.removeFromSuperview()            
        }
    }
}

