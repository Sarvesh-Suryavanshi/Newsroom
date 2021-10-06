//
//  HomePageModel.swift
//  Newsroom
//
//  Created by Sarvesh Suryavanshi on 06/10/21.
//

import Foundation

class HomePageModel: HomePageModelProtocol {
    
    func loadNewsFeed(completion: @escaping ([ArticleModel]?) -> Void) {
        let request = API.newsFeed.rawValue
        Network.loadAndParse(request: request, outputType: NewsFeedData.self) { result in
            switch result {
            case .success(let newsFeedData):
                    print(newsFeedData)
                completion(newsFeedData.articles)
                
            case .failure(.badRequest), .failure(.failedToDecode), .failure(.failedToLoad), .failure(.networkError):
                completion(nil)
            }
        }
    }
}
