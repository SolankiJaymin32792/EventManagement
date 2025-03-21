//
//  EventDetailVC.swift
//  Event Management
//
//  Created by Jaymin on 20/03/25.
//

import UIKit

class EventDetailVC: UIViewController {
    
    //MARK: - IBOutlet
    @IBOutlet weak var imgEvent: UIImageView!
    @IBOutlet weak var lblEventTitle: UILabel!
    @IBOutlet weak var lblEventLocation: UILabel!
    @IBOutlet weak var lblEventDate: UILabel!
    @IBOutlet weak var lblEventDetails: UILabel!
    @IBOutlet weak var lblEventPrice: UILabel!
    @IBOutlet weak var bgEventPriceView: UIView!

    
    
    // MARK: - Variables
    var selectedEvent: Event?
    
    //MARK: - View Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupData()
        
    }
    
    func setupData() {
        guard let event = selectedEvent else { return }
        lblEventTitle.text = event.title
        lblEventDate.text = event.date
        lblEventLocation.text = event.location
        lblEventPrice.text =  "₹" + event.price
        lblEventDetails.text = event.details
        
        imgEvent.image = UIImage(named: event.image)
        
        bgEventPriceView.layer.shadowColor = UIColor.gray.cgColor
        bgEventPriceView.layer.shadowOffset = CGSize(width: 1.0, height: 1.0)
        bgEventPriceView.layer.shadowOpacity = 0.5
        bgEventPriceView.layer.masksToBounds = false
        bgEventPriceView.layer.cornerRadius = 8.0
    }
    
    
    //MARK: - UIAction
    
    @IBAction func tapOnBack(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
    
    @IBAction func btnShare(_ sender: Any) {

        let imageToShare = [ "Share This Event"]
        let activityViewController = UIActivityViewController(activityItems: imageToShare, applicationActivities: nil)
        activityViewController.popoverPresentationController?.sourceView = self.view
        activityViewController.excludedActivityTypes = [ UIActivity.ActivityType.airDrop, UIActivity.ActivityType.postToFacebook ]
        self.present(activityViewController, animated: true, completion: nil)

    }
    
    @IBAction func btnBook(_ sender: Any) {
        
        let alert = UIAlertController(title: "Success", message: "Your event is booked successfully!", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default))
        present(alert, animated: true)
        
    }
    
}
