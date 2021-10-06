//
//  HomePageViewController.swift
//  Newsroom
//
//  Created by Sarvesh Suryavanshi on 05/10/21.
//

import UIKit

class HomePageViewController: UIViewController {
    
    //MARK: - IBOutlet
    @IBOutlet weak var collectionView: UICollectionView!
    
    //MARK: - Properties
    var viewModel: HomePageViewModelProtocol?
    
    //MARK: - Controller Lifecycle Methods
    override func viewDidLoad() {
        super.viewDidLoad()
        self.loadNewsFeed()
        self.setupCollectionView()
    }
}

//MARK: - Extension for UICollectionViewDataSource Methods

extension HomePageViewController: UICollectionViewDataSource {
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return HomeSection.allCases.count
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.viewModel?.articlesInSection(index: section) ?? 0
    }
    
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        if kind == UICollectionView.elementKindSectionHeader {
            guard
                let sectionHeaderView = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: HomeSectionHeaderView.reuseIdentifier, for: indexPath) as? HomeSectionHeaderView,
                let sectionType = HomeSection(rawValue: indexPath.section) else { return HomeSectionHeaderView() }
            sectionHeaderView.configure(title: sectionType.sectionTitle )
            return sectionHeaderView
        }
        assert(false, "Unexpected Element Kind")
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        if let sectionType = HomeSection(rawValue: indexPath.section),
           let article = sectionType == .topArticles ? self.viewModel?.topArticle(at: indexPath) : self.viewModel?.listArticle(at: indexPath){
            if let cell = collectionView.dequeueReusableCell(withReuseIdentifier: sectionType.reusableIdentifier, for: indexPath) as? NewsArticleCarousalCell {
                cell.configure(article: article)
                return cell
            }
        }
        return UICollectionViewCell()
    }
}

//MARK: - Extension for HomePageViewProtocol Methods

extension HomePageViewController: HomePageViewProtocol {
    
    func updateContent() {
        self.collectionView.reloadData()
    }
    
    func loadNewsFeed() {
        self.viewModel?.loadNewsFeed()
    }
}

//MARK: - Extension for Private Methods

private extension HomePageViewController {
    
    func setupCollectionView() {
        self.collectionView.collectionViewLayout = createCompositionLayout()
    }
    
    func createCompositionLayout() -> UICollectionViewCompositionalLayout {
        return UICollectionViewCompositionalLayout { sectionIndex, _ in
            let section = HomeSection(rawValue: sectionIndex)
            if section == .topArticles {
                return self.topArticleSectionLayout()
            }
            return self.listArticleSectionLayout()
        }
    }
    
    func topArticleSectionLayout() -> NSCollectionLayoutSection {
        let item = self.collectionItem()
        let groupSize = NSCollectionLayoutSize(
            widthDimension: .fractionalWidth(0.7),
            heightDimension: .fractionalHeight(0.4))
        let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize, subitems: [item])
        let section = NSCollectionLayoutSection(group: group)
        section.orthogonalScrollingBehavior = .continuous
        section.contentInsets = .init(top: 10, leading: 10, bottom: 10, trailing: 10)
        section.boundarySupplementaryItems = [self.headerViewItem()]
        
        return section
    }
    
    func listArticleSectionLayout() -> NSCollectionLayoutSection {
        let item = self.collectionItem()
        let groupSize = NSCollectionLayoutSize(
            widthDimension: .fractionalWidth(1),
            heightDimension: .fractionalHeight(0.2))
        let group = NSCollectionLayoutGroup.vertical(layoutSize: groupSize, subitems: [item])
        let section = NSCollectionLayoutSection(group: group)
        section.contentInsets = .init(top: 10, leading: 10, bottom: 10, trailing: 10)
        section.boundarySupplementaryItems = [self.headerViewItem()]
        return section
    }
    
    func collectionItem() -> NSCollectionLayoutItem {
        let itemSize = NSCollectionLayoutSize(
            widthDimension: .fractionalWidth(1),
            heightDimension: .fractionalHeight(1))
        let item = NSCollectionLayoutItem(layoutSize: itemSize)
        return item
    }
    
    func headerViewItem() -> NSCollectionLayoutBoundarySupplementaryItem {
        let footerHeaderSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0), heightDimension: .absolute(50.0))
        let header = NSCollectionLayoutBoundarySupplementaryItem(
            layoutSize: footerHeaderSize,
            elementKind: UICollectionView.elementKindSectionHeader,
            alignment: .top)
        return header
    }
}
