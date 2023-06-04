//
//  NewsVC.swift
//  banana
//
//  Created by Deniz on 4.06.2023.
//

import UIKit

class NewsVC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .systemBackground
        
        NewsService().downloadNews(for: "us") { article in
            guard let article = article else {return}
            print(article[1].title)
        }
    }

}
