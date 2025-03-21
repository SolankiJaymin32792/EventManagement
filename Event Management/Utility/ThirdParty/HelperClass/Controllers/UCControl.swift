//
//  Untitled.swift
//  Event Management
//
//  Created by Jaymin on 20/03/25.
//

import Foundation
import UIKit

//MARK: - SIControl
class UCControl : UIControl {
    @IBOutlet var arrWidthConstraint : [NSLayoutConstraint]!
    @IBOutlet var arrHeightConstraint : [NSLayoutConstraint]!
    
    override func awakeFromNib() {
        
        if arrWidthConstraint != nil
        {
            for const in arrWidthConstraint {
                const.constant = const.constant * DeviceScale.SCALE_X
            }
        }
        
        if arrHeightConstraint != nil
        {
            for const in arrHeightConstraint {
                const.constant = const.constant * DeviceScale.SCALE_Y
            }
        }
    }
    
    var indexPath: IndexPath?
}
