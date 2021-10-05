//
//  APIHomepage.swift
//  Newsroom
//
//  Created by Sarvesh Suryavanshi on 06/10/21.
//

import Foundation

// https://saurav.tech/NewsAPI/everything/cnn.json

enum API {
    
    case newsFeed
    case addToFavourite(String)
    
    
    var rawValue: URLRequest? {
        switch(self) {
            case .newsFeed:
            guard let apiURL = self.newsFeedURL else { return nil }
            return URLRequest(url: apiURL)
            
            case .addToFavourite(let articleID) :
            guard let apiURL = self.addToFavourite(articleID: articleID) else { return nil }
            return URLRequest(url: apiURL)
        }
    }
    
    private var baseURLComponent: URLComponents {
        var components = URLComponents()
        components.scheme = "https"
        components.host = "saurav.tech"
        return components
    }
        
    private var newsFeedURL: URL? {
        var component = self.baseURLComponent
        component.path = "/NewsAPI/everything/cnn.json"
        return component.url
    }
    
    private func addToFavourite(articleID: String) -> URL? {
        var component = self.baseURLComponent
        component.path = "NewsAPI/addToFavourite/"
        let queryItem = URLQueryItem(name: "articleID", value: articleID)
        component.queryItems?.append(queryItem)
        return component.url
    }
}
