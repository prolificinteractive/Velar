//
//  TestView.swift
//  Velar
//
//  Created by Jonathan Samudio on 1/24/17.
//  Copyright © 2017 Prolific Interactive. All rights reserved.
//

import UIKit

internal final class TestView: UIView {

    override func awakeFromNib() {
        super.awakeFromNib()
        
        addShadow(shadowColor: UIColor.black,
                  shadowOffset: CGSize(width: 0, height: 6),
                  shadowOpacity: 0.5,
                  shadowRadius: 6)
        
        layer.cornerRadius = 6
    }
    
    static func instanceFromNib() -> TestView {
        return UINib(nibName: "TestView", bundle: nil).instantiate(withOwner: nil, options: nil)[0] as! TestView
    }
    
    @IBAction fileprivate func didTapCloseButton(_ sender: Any) {
        // Hide View
    }
}
 
