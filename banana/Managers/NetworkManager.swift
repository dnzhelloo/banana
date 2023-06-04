//
//  NetworkManager.swift
//  banana
//
//  Created by Deniz on 4.06.2023.
//

import Foundation


class NetworkManager{
    static let shared = NetworkManager()
    private init(){}
    
    func download(url:URL,completion:@escaping(Result<Data,Error>)->Void){
        let task = URLSession.shared.dataTask(with: url) { data, response, error in
            if let error = error{
                print(error.localizedDescription)
                completion(.failure(error))
                return
            }
            
            guard let response = response as? HTTPURLResponse,response.statusCode == 200 else {
                completion(.failure(URLError(.badServerResponse)))
                return
            }
            
            guard let data = data else {
                completion(.failure(URLError(.dataNotAllowed)))
                return
            }
            completion(.success(data))
        }
        
        task.resume()
    }
}

