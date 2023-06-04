//
//  NewsService.swift
//  banana
//
//  Created by Deniz on 4.06.2023.
//

import Foundation

class NewsService{
    
    let baseURL = "https://newsapi.org/v2/"
    
    func downloadNews(for country:String,completion:@escaping([Article]?)->Void){
        
        let endpoint = baseURL + "top-headlines?country=\(country)&apiKey=007c8e0b92e04866a999be8d741136bf"
        guard let url = URL(string: endpoint) else {return}
        
        NetworkManager.shared.download(url: url) { result in
        
            switch result{
            case .success(let data):
                completion(self.handleWithData(data: data))
            case .failure(let error):
                self.handleWithError(error: error)
            }
        }
    }
    
    private func handleWithData(data:Data)->[Article]?{
        do{
            let decoder = JSONDecoder()
            decoder.keyDecodingStrategy = .convertFromSnakeCase
            let article = try? decoder.decode(News.self, from: data)
            return article?.articles
            
        } catch{
            print(error.localizedDescription)
            return nil
        }
    }
    
    private func handleWithError(error:Error){
        print(error.localizedDescription)
    }
     
}
