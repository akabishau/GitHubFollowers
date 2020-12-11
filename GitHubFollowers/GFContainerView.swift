//
//  GFContainerView.swift
//  GitHubFollowers
//
//  Created by Aleksey on 1210..20.
//

import UIKit

class GFContainerView: UIView {

    override init(frame: CGRect) {
        super.init(frame: frame)
        configure()
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    private func configure() {
        translatesAutoresizingMaskIntoConstraints = false
        backgroundColor = .systemBackground // white/black
        layer.cornerRadius = 16
        layer.borderWidth = 2 // makes sense for dark mode to pop the container view
        layer.borderColor = UIColor.white.cgColor
    }
}
