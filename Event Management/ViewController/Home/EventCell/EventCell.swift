//
//  EventCell.swift
//  Event Management
//
//  Created by Jaymin on 20/03/25.
//

import UIKit

class EventCell: UITableViewCell {

    
    //MARK: - IBOutlet
    
    @IBOutlet weak var bgView: UIView!
    @IBOutlet weak var imgEvent: UIImageView!
    @IBOutlet weak var lblEventTitle: UILabel!
    @IBOutlet weak var lblEventDetails: UILabel!
    @IBOutlet weak var lblEventPrice: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()

        setupCardView()
    }
    
    //MARK: - Card View
    func setupCardView() {
        bgView.layer.shadowColor = UIColor.gray.cgColor
        bgView.layer.shadowOffset = CGSize(width: 1.0, height: 1.0)
        bgView.layer.shadowOpacity = 0.5
        bgView.layer.masksToBounds = false
        bgView.layer.cornerRadius = 8.0
        imgEvent.layer.cornerRadius = 8.0
    }
}
