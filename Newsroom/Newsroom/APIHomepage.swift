//
//  APIHomepage.swift
//  Newsroom
//
//  Created by Sarvesh Suryavanshi on 06/10/21.
//

import Foundation

/// Enum representing web services
enum API {
    
    case newsFeed
    case addToFavourite(String) /// Sample API case to represent how this enum can be scaled to encorporate more requests
    
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
    
    /// Configures base url component
    private var baseURLComponent: URLComponents {
        var components = URLComponents()
        components.scheme = "https"
        components.host = "saurav.tech"
        return components
    }
    
    /// Provides news feed Api Url
    private var newsFeedURL: URL? {
        var component = self.baseURLComponent
        component.path = "/NewsAPI/everything/cnn.json"
        return component.url
    }
    
    /// Provides add to favourite Api Url
    private func addToFavourite(articleID: String) -> URL? {
        var component = self.baseURLComponent
        component.path = "NewsAPI/addToFavourite/"
        let queryItem = URLQueryItem(name: "articleID", value: articleID)
        component.queryItems?.append(queryItem)
        return component.url
    }
}
