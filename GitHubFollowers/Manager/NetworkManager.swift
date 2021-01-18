//
//  NetworkManager.swift
//  GitHubFollowers
//
//  Created by Aleksey on 1214..20.
//

import UIKit

class NetworkManager {
    
    // Singleton syntax
    static let shared = NetworkManager()
    private init()  { }
    
    private let baseUrl = "https://api.github.com/users/" // build url constructor
    
    let cache = NSCache<NSString, UIImage>()
    
    
    func getFollowers(for username: String, page: Int, completion: @escaping (Result<[Follower], GFError>) -> Void) {
        let endpoint = baseUrl + "\(username)/followers?per_page=100&page=\(page)"
        
        guard let url = URL(string: endpoint) else {
            completion(.failure(.invalidUsername))
            return
        }
        
        let task = URLSession.shared.dataTask(with: url) { (data, response, error) in
            if let _ = error {
                completion(.failure(.unableToComplete))
                return
            }
            
            guard let response = response as? HTTPURLResponse, response.statusCode == 200 else {
                completion(.failure(.invalidResponse))
                return
            }
            
            guard let data = data else  {
                completion(.failure(.invalidData))
                return
            }
            
            do {
                let decoder = JSONDecoder()
                decoder.keyDecodingStrategy = .convertFromSnakeCase // to handle github api
                let followers = try decoder.decode([Follower].self, from: data)
                completion(.success(followers))
            } catch {
                completion(.failure(.invalidData))
            }
            
        }
        task.resume()
    }
}
