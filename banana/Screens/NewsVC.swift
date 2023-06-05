//
//  NewsVC.swift
//  banana
//
//  Created by Deniz on 4.06.2023.
//

import UIKit

class NewsVC: UIViewController {
    
    enum Section{
        case main
    }
    
    var page = 1
    var articles:[Article] = []
    var filteredArticles: [Article] = []
    var collectionView:UICollectionView!
    var dataSource:UICollectionViewDiffableDataSource<Section,Article>!
    var hasMoreArticles = true
    
    var isSearching = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .systemBackground
        
        configureCollectionView()
        getArticles(topic: "apple", page: page)
        configureSearchController()
        configureDataSource()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.navigationBar.prefersLargeTitles = true
    }
    
    func getArticles(topic:String,page:Int){
        showLoadingView()
        NewsService().downloadNews(page: page) {[weak self] article in
            guard let self = self, let article = article else { return }
            dismissLoadingView()
            
            if article.count < 100 { self.hasMoreArticles = false }
            self.articles = article
            self.updateData(on:self.articles)
            
        }
    }
    
    func configureSearchController() {
        let searchController                                    = UISearchController()
        searchController.searchResultsUpdater                   = self
        searchController.searchBar.delegate                     = self
        searchController.searchBar.placeholder                  = "Search for a news"
        searchController.obscuresBackgroundDuringPresentation   = false
        navigationItem.searchController                         = searchController
    }
    
    
    
    func configureCollectionView(){
        collectionView = UICollectionView(frame: view.bounds, collectionViewLayout:UIHelper().createOneColumnFlowLayout(in: view))
        view.addSubview(collectionView)
        collectionView.delegate = self
        collectionView?.backgroundColor = .systemBackground
        collectionView.register(NewsCell.self, forCellWithReuseIdentifier: NewsCell.reuseID)
    }
    
    
    func configureDataSource(){
        dataSource = UICollectionViewDiffableDataSource<Section,Article>(collectionView: collectionView, cellProvider: { collectionView, indexPath, article ->UICollectionViewCell? in
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: NewsCell.reuseID, for: indexPath) as? NewsCell
            cell?.set(article: article)
            return cell
        })
    }
    
    func updateData(on articles: [Article]) {
        var snapshot = NSDiffableDataSourceSnapshot<Section, Article>()
        snapshot.appendSections([.main])
        snapshot.appendItems(articles)
        DispatchQueue.main.async { self.dataSource.apply(snapshot, animatingDifferences: true) }
    }
    
}


extension NewsVC: UICollectionViewDelegate {
    func scrollViewDidEndDragging(_ scrollView: UIScrollView, willDecelerate decelerate: Bool) {
        let offsetY         = scrollView.contentOffset.y
        let contentHeight   = scrollView.contentSize.height
        let height          = scrollView.frame.size.height
        
        if offsetY > contentHeight - height {
            guard hasMoreArticles else { return }
            page += 1
            getArticles(topic:"apple" , page: page)
        }
    }
}

extension NewsVC: UISearchResultsUpdating, UISearchBarDelegate {
    
    func updateSearchResults(for searchController: UISearchController) {
        guard let filter = searchController.searchBar.text, !filter.isEmpty else { return }
        isSearching = true
        filteredArticles = articles.filter { $0.title.lowercased().contains(filter.lowercased()) }
        updateData(on: filteredArticles)
    }
    
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        isSearching = false
        updateData(on: articles)
    }
}

