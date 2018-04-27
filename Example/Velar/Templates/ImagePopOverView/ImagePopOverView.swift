//
//  ImagePopOverView.swift
//  Velar
//
//  Created by Jonathan Samudio on 2/8/17.
//  Copyright © 2017 Prolific Interactive. All rights reserved.
//

import UIKit
import Velar

final class ImagePopOverView: UIView {

    weak var delegate: ImagePopOverDelegate?

    lazy var modalView: VelarPresenter = {
        guard let window = UIApplication.shared.delegate?.window else {
            return VelarPresenter(parentWindow: UIWindow(), designer: DefaultBackgroundOverlayDesigner())
        }
        return VelarPresenter(parentWindow: window!, designer: DefaultBackgroundOverlayDesigner())
    }()
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        addShadow(shadowColor: UIColor.black,
                  shadowOffset: CGSize(width: 0, height: 6),
                  shadowOpacity: 0.5,
                  shadowRadius: 6)
        
        layer.cornerRadius = 6
    }
    
    @IBOutlet weak var button: UIButton! {
        didSet {
            button.layer.cornerRadius = 6
        }
    }
    
    @IBOutlet weak var imageView: UIImageView! {
        didSet {
            imageView.image = UIImage(named: "CalendarIcon")?.withRenderingMode(.alwaysOriginal)
        }
    }
    
    static func instanceFromNib() -> ImagePopOverView {
        return UINib(nibName: "ImagePopOverView", bundle: nil).instantiate(withOwner: nil, options: nil)[0] as! ImagePopOverView
    }

    @IBAction func buttonSelected() {
        delegate?.buttonSelected()
    }
}
