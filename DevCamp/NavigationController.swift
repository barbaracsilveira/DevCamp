//
//  NavigationController.swift
//  DevCamp
//
//  Created by Bárbara Carvalho Silveira on 29/07/19.
//  Copyright © 2019 Bárbara Carvalho Silveira. All rights reserved.
//

import UIKit

final class NavigationController: UINavigationController {
    override var preferredStatusBarStyle: UIStatusBarStyle { return .lightContent }
}

extension UINavigationBar {
    func transparent() {
        self.setBackgroundImage(UIImage(), for: .default)
        self.shadowImage = UIImage()
        self.isTranslucent = true
    }
}
