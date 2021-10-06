//
//  HomePageBuilder.swift
//  Newsroom
//
//  Created by Sarvesh Suryavanshi on 06/10/21.
//

import UIKit

class HomePageBuilder {
    
    /// Builder method to create instance of HomePageViewController
    /// - Returns: returns HomePageViewController
    class func buildHomePageView() -> HomePageViewController? {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        guard let view = storyboard.instantiateViewController(withIdentifier: "HomePageViewController") as? HomePageViewController else { return nil }
        let model = HomePageModel()
        let viewModel = HomePageViewModel(model: model, view: view)
        view.viewModel = viewModel
        return view
    }
    
}
