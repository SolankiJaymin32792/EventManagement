//
//  HomeVC.swift
//  Event Management
//
//  Created by Jaymin on 20/03/25.
//

import UIKit

class EventVC: UIViewController {
    
    // MARK: - IBOutlet
    @IBOutlet weak var tblEvent: UITableView!
    
    //MARK: - View Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
      
        tblEvent.register(UINib(nibName: "EventCell", bundle: nil), forCellReuseIdentifier: "EventCell")
    }
    
    //MARK: - CallLogut
    
    func  callLogut(){
        let refreshAlert = UIAlertController(title: "Sign Out", message: "Are You Sure you want to SignOut ? ", preferredStyle: UIAlertController.Style.alert)
        
        refreshAlert.addAction(UIAlertAction(title: "Sign Out", style: .default, handler: { (action: UIAlertAction!) in
            
            let initVC = UIStoryboard(name: "Login", bundle: nil).instantiateViewController(withIdentifier: "LoginVC") as! LoginVC
            
            self.navigationController?.pushViewController(initVC, animated: true)

        }))
        
        refreshAlert.addAction(UIAlertAction(title: "Cancel", style: .default, handler: { (action: UIAlertAction!) in
            
            refreshAlert .dismiss(animated: true, completion: nil)
            
        }))
        present(refreshAlert, animated: true, completion: nil)
    }
    
    
    @IBAction func btnLogout(_ sender: Any) {
        callLogut()
    }
}

// MARK: - UITableViewDelegate, UITableViewDataSource
extension EventVC: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
   
        let cell = tableView.dequeueReusableCell(withIdentifier: "EventCell") as! EventCell
        
        let event = data[indexPath.row]
        cell.lblEventTitle.text = event.title
        cell.lblEventDetails.text = event.details
        cell.lblEventPrice.text = "₹" + event.price 
        cell.imgEvent.image = UIImage(named: event.image)
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let selectedEvent = data[indexPath.row]
        
        let storyboard = UIStoryboard(name: "Event", bundle: nil)
        if let eventDetailVC = storyboard.instantiateViewController(withIdentifier: "EventDetailVC") as? EventDetailVC {
            eventDetailVC.selectedEvent = selectedEvent
            navigationController?.pushViewController(eventDetailVC, animated: true)
        }
    }
}
