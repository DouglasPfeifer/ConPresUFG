//
//  UITableView+Util.swift
//  ConPresApp
//
//  Created by Douglas Tonetto Pfeifer on 22/12/20.
//  Copyright © 2020 Douglas Tonetto Pfeifer. All rights reserved.
//

import Foundation
import UIKit

extension UITableView {

    func setAtivityIndicator() {
        let loadingIndicator = UIActivityIndicatorView(frame: CGRect(x: 0, y: 0, width: 50, height: 50))
        loadingIndicator.hidesWhenStopped = true
        loadingIndicator.style = UIActivityIndicatorView.Style.large
        loadingIndicator.color = UIColor.darkGray
        loadingIndicator.startAnimating()
        
        self.backgroundView = loadingIndicator
        self.separatorStyle = .none
    }
    
    func setEmptyMessage(message: String) {
            let messageLabel = UILabel(frame: CGRect(x: 0, y: 0, width: self.bounds.size.width, height: self.bounds.size.height))
            messageLabel.text = message
            messageLabel.textColor = .black
            messageLabel.numberOfLines = 0
            messageLabel.textAlignment = .center
            messageLabel.font = UIFont.systemFont(ofSize: 16)
            messageLabel.sizeToFit()

            self.backgroundView = messageLabel
            self.separatorStyle = .none
        }

    func restore() {
        self.backgroundView = nil
        self.separatorStyle = .singleLine
    }
}
