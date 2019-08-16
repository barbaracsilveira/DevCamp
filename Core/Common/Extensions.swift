//
//  Extensions.swift
//  DevCamp
//
//  Created by Bárbara Carvalho Silveira on 28/07/19.
//  Copyright © 2019 Bárbara Carvalho Silveira. All rights reserved.
//

import UIKit

extension Array {
    subscript(safeIndex index: Int) -> Element? {
        guard index >= 0, index < endIndex else {
            return nil
        }
        return self[index]
    }
}

extension UIColor {
    static var themeBlue: UIColor { return UIColor(named: "themeBlue") ?? .clear }
    static var themeGray: UIColor { return UIColor(named: "themeGray") ?? .clear }
}

extension UIDevice {
    static func isTV() -> Bool {
        return UIDevice.current.userInterfaceIdiom == .tv
    }
}
