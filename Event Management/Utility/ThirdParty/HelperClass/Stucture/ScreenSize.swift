//
//  ScreenSize.swift
//  Event Management
//
//  Created by Jaymin on 20/03/25.
//

import Foundation
import UIKit

//MARK: - Screen Size
struct ScreenSize {
    static let WIDTH         = UIScreen.main.bounds.size.width
    static let HEIGHT        = UIScreen.main.bounds.size.height
    static let SCREEN_MAX_LENGTH    = max(ScreenSize.WIDTH, ScreenSize.HEIGHT)
    static let SCREEN_MIN_LENGTH    = min(ScreenSize.WIDTH, ScreenSize.HEIGHT)
}
