//
//  DeviceVersion.swift
//  Event Management
//
//  Created by Jaymin on 20/03/25.
//

import Foundation
import UIKit

//MARK: - Device iOS Version
struct DeviceVersion {
    static let Device = UIDevice.current
    static let iosVersion = NSString(string: Device.systemVersion).doubleValue
    static let iOS9 = iosVersion >= 9
    static let iOS10 = iosVersion >= 10
    static let iOS11 = iosVersion >= 11
    static let iOS12 = iosVersion >= 12
    static let iOS13 = iosVersion >= 13
    static let iOS14 = iosVersion >= 14
}
