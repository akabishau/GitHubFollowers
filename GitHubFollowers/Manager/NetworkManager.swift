//
//  NetworkManager.swift
//  GitHubFollowers
//
//  Created by Aleksey on 1214..20.
//

import Foundation

class NetworkManager {
    
    // Singleton syntax
    static let shared = NetworkManager()
    private init()  { }
    
    let baseUrl = "https://api.github.com/users/" // build url constructor
    
    
    func getFollowers(for username: String, page: Int, completion: @escaping ([Follower]?, String?) -> Void) {
        let endpoint = baseUrl + "\(username)/followers?per_page=100&page=\(page)"
        
        guard let url = URL(string: endpoint) else {
            completion(nil, "This username created an invalid request. Please try again.")
            return
        }
        
        let task = URLSession.shared.dataTask(with: url) { (data, response, error) in
            if let _ = error {
                completion(nil, "Unable to complete your request. Please check your internet connection.")
                return
            }
            
            guard let response = response as? HTTPURLResponse, response.statusCode == 200 else {
                completion(nil, "Invalid response from the server. Please try again")
                return
            }
            
            guard let data = data else  {
                completion(nil, "The data received from the server was invalid. Please try again")
                return
            }
            
            do {
                let decoder = JSONDecoder()
                decoder.keyDecodingStrategy = .convertFromSnakeCase // to handle github api
                let followers = try decoder.decode([Follower].self, from: data)
                completion(followers, nil)
            } catch {
                completion(nil, "The data received from the server was invalid. Please try again")
            }
            
        }
        task.resume()
    }
}
