//From http://www.totem.training/swift-ios-tips-tricks-tutorials-blog/ux-chops-dim-the-lights

import Foundation
import UIKit

enum Direction { case `in`, out }
protocol Dimmable { }

extension Dimmable where Self: UIViewController {
    
    func dim(_ direction: Direction, color: UIColor = UIColor.black, alpha: CGFloat = 0.2, speed: Double = roofUITimeIntervalStandard) {
        
        switch direction {
        case .in:
            // Create and add a dim view
            let dimView = UIView(frame: view.frame)
            dimView.backgroundColor = color
            dimView.alpha = 0.0
            view.addSubview(dimView)
            
            // Deal with Auto Layout
            dimView.translatesAutoresizingMaskIntoConstraints = false
            view.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "|[dimView]|", options: [], metrics: nil, views: ["dimView": dimView]))
            view.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "V:|[dimView]|", options: [], metrics: nil, views: ["dimView": dimView]))
            
            // Animate alpha (the actual "dimming" effect)
            UIView.animate(withDuration: speed, animations: { () -> Void in
                dimView.alpha = alpha
            }) 
            
        case .out:
            UIView.animate(withDuration: speed, animations: { () -> Void in
                self.view.subviews.last?.alpha = alpha
                }, completion: { (complete) -> Void in
                    self.view.subviews.last?.removeFromSuperview()
            })
        }
    }
}
