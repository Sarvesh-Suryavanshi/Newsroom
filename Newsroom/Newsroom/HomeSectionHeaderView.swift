//
//  HomeSectionHeaderView.swift
//  Newsroom
//
//  Created by Sarvesh Suryavanshi on 07/10/21.
//

import UIKit

class HomeSectionHeaderView: UICollectionReusableView {

    //MARK: - Properties

    @IBOutlet weak var sectionTitleLabel: UILabel!
    static let reuseIdentifier = "HomeSectionHeaderView"
    
    //MARK: - Method Configuration

    func configure(title: String) {
        self.sectionTitleLabel.text = title
    }
}
