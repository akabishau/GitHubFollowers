//
//  FollowerListVC.swift
//  GitHubFollowers
//
//  Created by Aleksey on 1208..20.
//

import UIKit

class FollowerListVC: UIViewController {
    
    var username: String!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .systemBackground
        navigationController?.isNavigationBarHidden = false
    }
}
