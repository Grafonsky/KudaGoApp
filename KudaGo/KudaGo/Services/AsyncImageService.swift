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
    
    var urlString: String?
    
    init(urlString: String?) {
        self.urlString = urlString
        loadImage()
    }
    
    func loadImage() {
        loadImageFromUrl()
    }
    
    func loadImageFromUrl() {
        guard let urlString = urlString,
              let url = URL(string: urlString)
        else { return }
        
        let task = URLSession.shared.dataTask(
            with: url,
            completionHandler: getImageFromResponse(data:response:error:))
        task.resume()
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
