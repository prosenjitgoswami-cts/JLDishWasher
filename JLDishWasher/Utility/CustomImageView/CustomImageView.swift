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

    override func layoutSubviews() {
        super.layoutSubviews()
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
            let url:URL! = URL(string: urlString)
            task = session.downloadTask(with: url, completionHandler: { (location, response, error) -> Void in
                if let data = try? Data(contentsOf: url){
                    DispatchQueue.main.async(execute: { () -> Void in
                        let downloadedImage:UIImage! = UIImage(data: data)
                        self.image = downloadedImage
                        DefaultCache.shared.setObject(downloadedImage, forKey: urlString as AnyObject)
                    })
                }
            })
            task.resume()
        }
    }

}

