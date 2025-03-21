//
//  AppDelegate.swift
//  Event Management
//
//  Created by Jaymin on 20/03/25.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        return true
    }
}

// MARK: - Toast Extension
extension AppDelegate {
    
    func showToast(message: String, font: UIFont = .systemFont(ofSize: 16, weight: .bold)) {
        guard let window = UIApplication.shared.windows.first else { return }
        
        let toastLabel = UILabel()
        toastLabel.text = message
        toastLabel.textColor =  ThemeColor.ThemWhite
        toastLabel.backgroundColor = ThemeColor.ThemeLightBlue.withAlphaComponent(0.6)
        toastLabel.textAlignment = .center
        toastLabel.font = font
        toastLabel.numberOfLines = 0
        toastLabel.layer.cornerRadius = 10
        toastLabel.clipsToBounds = true
        toastLabel.alpha = 0.0
        
        // Calculate proper width and height
        let maxWidth = window.frame.width - 40
        let textSize = toastLabel.sizeThatFits(CGSize(width: maxWidth, height: CGFloat.greatestFiniteMagnitude))
        let toastWidth = min(textSize.width + 40, maxWidth)
        let toastHeight = textSize.height + 20
        
        toastLabel.frame = CGRect(
            x: (window.frame.width - toastWidth) / 2,
            y: window.frame.height - 120,
            width: toastWidth,
            height: toastHeight
        )

        window.addSubview(toastLabel)

        // Show animation
        UIView.animate(withDuration: 0.3, animations: {
            toastLabel.alpha = 1.0
        }) { _ in
            UIView.animate(withDuration: 0.3, delay: 2.0, options: .curveEaseOut, animations: {
                toastLabel.alpha = 0.0
            }) { _ in
                toastLabel.removeFromSuperview()
            }
        }
    }
}
