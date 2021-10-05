//
//  ViewController.swift
//  Newsroom
//
//  Created by Sarvesh Suryavanshi on 05/10/21.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        let request = API.newsFeed.rawValue
        Network.loadAndParse(request: request, outputType: NewsFeedData.self) { result in
            switch result {
            case .success(let newsFeed):
                    print(newsFeed)
            case .failure(.badRequest):
                print("BAD REQUEST")
            case .failure(.failedToDecode):
                print("FAIELD TO DECODE")
            case .failure(.failedToLoad):
                print("FAILED TO LOAD")
            case .failure(.networkError):
                print("NETWORK ERROR")
            }
        }
    }
}

