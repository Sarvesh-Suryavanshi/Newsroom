//
//  HomePageViewModel.swift
//  Newsroom
//
//  Created by Sarvesh Suryavanshi on 06/10/21.
//

import Foundation

enum HomeSection: Int, CaseIterable {
    case topArticles
    case listArticles
    
    //MARK: - Properties

    var sectionTitle: String {
        switch self {
        case .topArticles: return "Handpicked for you"
        case .listArticles: return "Top Stories"
        }
    }
    
    var reusableIdentifier: String {
        switch self {
        case .topArticles: return NewsArticleCarousalCell.reuseIdentifierType1
        case .listArticles: return NewsArticleCarousalCell.reuseIdentifierType2
        }
    }
}

class HomePageViewModel {
    
    //MARK: - Properties
    
    private let model: HomePageModelProtocol
    private let view: HomePageViewProtocol
    
    private lazy var topArticles: [ArticleModel]? = []
    private lazy var listArticles: [ArticleModel]? = []
    
    //MARK: - Initializer

    init(model: HomePageModelProtocol, view: HomePageViewProtocol) {
        self.model = model
        self.view = view
    }
}

//MARK: - HomePageViewModelProtocol Methods

extension HomePageViewModel: HomePageViewModelProtocol {

    func topArticle(at index: IndexPath) -> ArticleModel? {
        guard let topArticles = self.topArticles, !topArticles.isEmpty else { return nil }
        if topArticles.indices.contains(index.row) {
            return topArticles[index.row]
        }
        return nil
    }
    
    func listArticle(at index: IndexPath) -> ArticleModel? {
        guard let listArticles = self.listArticles, !listArticles.isEmpty else { return nil }
        if listArticles.indices.contains(index.row) {
            return listArticles[index.row]
        }
        return nil
    }
    
    func articlesInSection(index: Int) -> Int {
        guard let section = HomeSection(rawValue: index) else { return 0 }
        switch section {
        case .topArticles:
            return self.topArticlesCount
        case .listArticles:
            return self.listArticlesCount
        }
    }
    
    func loadNewsFeed() {
        self.model.loadNewsFeed { articles in
            guard let articles = articles else { return }
            self.sortAndSaveArticles(articles: articles)
        }
    }
}

//MARK: - Extension for Private and Properties Methods

private extension HomePageViewModel {
    
    var topArticlesCount: Int {
        self.topArticles?.count ?? 0
    }
    
    var listArticlesCount: Int {
        self.listArticles?.count ?? 0
    }
    
    func sortAndSaveArticles(articles: [ArticleModel]) {
        if !articles.isEmpty {
            let sortedArticles = articles.sorted { article1, article2 in
                return article1.publishedAt > article1.publishedAt
            }
            sortedArticles.enumerated().forEach { (index, article) in
                if index < 6 { self.topArticles?.append(article) }
                else { self.listArticles?.append(article) }
            }
        }
        DispatchQueue.main.async {
            self.view.updateContent()
        }
    }
}
