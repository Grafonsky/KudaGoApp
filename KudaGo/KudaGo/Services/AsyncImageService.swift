//
//  AsyncImageService.swift
//  KudaGo
//
//  Created by Bohdan Hawrylyshyn on 23.01.23.
//

import UIKit

class AsyncImageService: ObservableObject {
    
    @Published var image: UIImage?
    @Published var isLoaded = false
    
    let cachesURL: URL
    let diskCacheURL: URL
    let cache: URLCache
    
    var urlString: String?
    
    init(urlString: String?) {
        self.urlString = urlString
        cachesURL = FileManager.default.urls(for: .cachesDirectory, in: .userDomainMask)[0]
        diskCacheURL = cachesURL.appendingPathComponent("DownloadCache")
        cache = URLCache(memoryCapacity: 10_000_000, diskCapacity: 1_000_000_000, directory: diskCacheURL)
        loadImage()
    }
    
    func loadImage() {
        loadImageFromUrl()
    }
    
    func loadImageFromUrl() {
        guard let urlString = urlString,
              let url = URL(string: urlString)
        else { return }
        
        let config = URLSessionConfiguration.default
        config.urlCache = cache
        
        let session = URLSession(configuration: config)
        let req = URLRequest(url: url, cachePolicy: .returnCacheDataElseLoad)
        session.dataTask(
            with: req,
            completionHandler: getImageFromResponse(data:response:error:))
        .resume()
    }
    
    func getImageFromResponse(data: Data?, response: URLResponse?, error: Error?) {
        guard error == nil
        else {
            print("Error: \(String(describing: error))")
            return
        }
        guard let data = data
        else {
            print("No data found")
            return
        }
        
        DispatchQueue.main.async {
            guard let loadedImage = UIImage(data: data)
            else { return }
            self.image = loadedImage
            self.isLoaded = true
        }
    }
}
