//
//  UIViewController+Ext.swift
//  GitHubFollowers
//
//  Created by Aleksey on 1210..20.
//

import UIKit

extension UIViewController {
    
    // available for each subclass
    func presentGFAlertOnMainThread(title: String, message: String, buttonTitle: String) {
        DispatchQueue.main.async {
            let alertVC = GFAlertVC(title: title, message: message, buttonTitle: buttonTitle)
            alertVC.modalPresentationStyle = .fullScreen
            alertVC.modalTransitionStyle = .crossDissolve
            self.present(alertVC, animated: true, completion: nil)
        }
    }
}
