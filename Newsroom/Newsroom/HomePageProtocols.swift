//
//  HomePageProtocols.swift
//  Newsroom
//
//  Created by Sarvesh Suryavanshi on 06/10/21.
//

import Foundation

//MARK: - HomePage View Protocol
protocol HomePageViewProtocol: AnyObject {
    
    func loadNewsFeed()
    
    func updateContent()
}

//MARK: - HomePage ViewModel Protocol
protocol HomePageViewModelProtocol: AnyObject {
    
    func loadNewsFeed()
    
    func articlesInSection(index: Int) -> Int
    
    func topArticle(at index: IndexPath) -> ArticleModel?

    func listArticle(at index: IndexPath) -> ArticleModel?
}

//MARK: - HomePage Model Protocol
protocol HomePageModelProtocol: AnyObject {
    
    func loadNewsFeed(completion: @escaping ([ArticleModel]?) -> Void)
}
