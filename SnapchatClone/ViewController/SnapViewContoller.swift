//
//  SnapViewContoller.swift
//  SnapchatClone
//
//  Created by Emre Şahin on 7.07.2024.
//

import UIKit
import ImageSlideshow

class SnapViewContoller: UIViewController {

    @IBOutlet weak var timeLabel: UILabel!
    
    var selectedSnap : Snap?
    var inputArray = [AlamofireSource]()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let snap = selectedSnap {
            
            timeLabel.text = "Time Left: \(snap.timeDifference)"
            
            for imageUrl in snap.imageUrlArray {
                inputArray.append(AlamofireSource(urlString: imageUrl)!)
            }
            
            let imageSlideShow = ImageSlideshow(frame: CGRect(x: 10, y: 10, width: self.view.frame.width * 0.95, height: self.view.frame.height * 0.90))
            imageSlideShow.backgroundColor = UIColor.systemIndigo
            
            imageSlideShow.contentScaleMode = UIViewContentMode.scaleAspectFit
            imageSlideShow.setImageInputs(inputArray)
            self.view.addSubview(imageSlideShow)
            self.view.bringSubviewToFront(timeLabel)

        }
    }
}
