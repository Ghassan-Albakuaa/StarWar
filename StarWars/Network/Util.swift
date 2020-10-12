//
//  Util.swift
//  StarWars
//
//  Created by Ghassan  albakuaa  on 10/12/20.
//

import UIKit

extension UIView {
    
    func superViewBind(constant: CGFloat = 0) {
        
        guard let safe = self.superview?.safeAreaLayoutGuide else { return }
        
        self.topAnchor.constraint(equalTo: safe.topAnchor, constant: constant).isActive = true
        self.leadingAnchor.constraint(equalTo: safe.leadingAnchor, constant: constant).isActive = true
        self.trailingAnchor.constraint(equalTo: safe.trailingAnchor, constant: constant).isActive = true
        self.bottomAnchor.constraint(equalTo: safe.bottomAnchor, constant: constant).isActive = true
    }
}
