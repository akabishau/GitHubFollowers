//
//  GFBodyLabel.swift
//  GitHubFollowers
//
//  Created by Aleksey on 1209..20.
//

import UIKit

class GFBodyLabel: UILabel {

    override init(frame: CGRect) {
        super.init(frame: frame)
        configure()
    }
    
    required init?(coder: NSCoder) { fatalError("init(coder:) has not been implemented") }
    
    
    init(textAlignment: NSTextAlignment) {
        super.init(frame: .zero)
        self.textAlignment = textAlignment
        configure()
    }
    
    
    private func configure() {
        translatesAutoresizingMaskIntoConstraints = false
        textColor = .secondaryLabel // black or white for light/dark mode
        font = UIFont.preferredFont(forTextStyle: .body) // using dynamic type
        adjustsFontSizeToFitWidth = true
        minimumScaleFactor = 0.75
        lineBreakMode = .byWordWrapping
        // keeping numberOfLines out of configure -> customize for specific view controller
    }
}
