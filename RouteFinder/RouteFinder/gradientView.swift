//
//  gradientView.swift
//  RouteFinder
//
//  Created by Bucataru Cristian on 5/21/17.
//  Copyright © 2017 Bucataru Cristian. All rights reserved.
//

import UIKit
@IBDesignable
class gradientView: UIView{
    @IBInspectable var FirstColor: UIColor = UIColor.clear {
        didSet{
            updateView()
        }
    }
    @IBInspectable var SecondColor: UIColor = UIColor.clear{
        didSet{
            updateView()
        }
    }
    override class var layerClass: AnyClass{
        get{
            return CGGradient.self
        }
    }
    func updateView(){
        let layer = self.layer as! CAGradientLayer
        layer.colors = [FirstColor.cgColor, SecondColor.cgColor]
        layer.locations = [0.5]
    }
}
