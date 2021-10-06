//
//  NewsArticleCarousalCell.swift
//  Newsroom
//
//  Created by Sarvesh Suryavanshi on 06/10/21.
//

import UIKit

class NewsArticleCarousalCell: UICollectionViewCell {
    
    //MARK: - IBOutlet

    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var authorLabel: UILabel!
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var articleImage: UIImageView!

    //MARK: - Properties

    static let reuseIdentifierType1 = "NewsArticleCarousalCell"
    static let reuseIdentifierType2 = "NewsArticleListCell"
    
    //MARK: - Method Configuration

    func configure(article: ArticleModel) {
        self.layer.shadowColor = UIColor.black.cgColor
        self.layer.shadowRadius = 1
        self.layer.shadowOffset = CGSize(width: 1, height: 1)
        self.layer.shadowOpacity = 1
        
        self.titleLabel.text = article.title
        self.authorLabel.text = article.author ?? ""
        self.dateLabel.text = article.publishedAt.displayDate
        self.articleImage.loadImage(imageURL: article.urlToImage)
    }
}
