//
//  ViewController.swift
//  sampleruralarea
//
//  Created by Ron Rith on 5/14/18.
//  Copyright © 2018 Ron Rith. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var slideimageView: UIImageView!
    @IBOutlet weak var imageHeightConstraint: NSLayoutConstraint!
    
    @IBOutlet weak var leadingConstraint: NSLayoutConstraint!
    var menuShowing = false
    @IBOutlet weak var menuView: UIView!
    
    override func viewDidLoad() {
        displaySlideImageView()
        super.viewDidLoad()
    }
    func displayMenuSideBar(){
        menuView.layer.shadowOpacity = 1
        menuView.layer.shadowRadius = 6
    }
    func displaySlideImageView(){
        let url = "https://upload.wikimedia.org/wikipedia/commons/thumb/4/41/Angkor_Wat.jpg/1280px-Angkor_Wat.jpg"
      
        //let url = "https://fossbytes.com/wp-content/uploads/2018/05/YouTube-remind-me-to-take-a-break-main.png"
        slideimageView.downloadImageWith(urlString: url, completion:   {
            if let image = self.slideimageView.image{
                let aspect = ((image.size.height)/2) / image.size.width
                
                self.imageHeightConstraint.constant = self.view.frame.size.width * aspect
            }
        })
        
    }
    @IBAction func OpenMenuSideBar(_ sender: Any) {
        if(menuShowing){
            leadingConstraint.constant =  -207
        } else{
            leadingConstraint.constant = 0
            UIView.animate(withDuration: 0.3) {
                self.view.layoutIfNeeded()
            }
        }
        menuShowing = !menuShowing
    }
    
}

