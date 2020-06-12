//
//  Route.swift
//  RouteFinder
//
//  Created by Bucataru Cristian on 5/17/17.
//  Copyright © 2017 Bucataru Cristian. All rights reserved.
//

import Foundation
import UIKit

class Route {
    var title: String?
    var description: String?
    
    init?(title: String, description: String) {
        
        guard !title.isEmpty else{
            return nil
        }
        
        guard !description.isEmpty else{
            return nil
        }
        
        self.title = title
        self.description = description
    }
}
