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
    
    var category = ["Value1","Value2","Value3","Value4"]
    @IBOutlet weak var categoryUIButton: UIButton!
    @IBOutlet weak var categoryTableView: UITableView!
    
    
    override func viewDidLoad() {
        displaySlideImageView()
        super.viewDidLoad()
        //categoryTableView.isHidden = true
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
    @IBAction func categoryAction(_ sender: Any) {
        print("Welcome")
//        if categoryTableView.isHidden {
//            animat(toogle: true)
//        }else{
//            animat(toogle: false)
//        }
    }
    func animat(toogle: Bool){
        if toogle{
            UIView.animate(withDuration: 0.3) {
                self.categoryTableView.isHidden = false
            }
        }else{
            UIView.animate(withDuration: 0.3) {
                self.categoryTableView.isHidden = true
            }
        }
        
    }
    
    
}
extension ViewController: UITableViewDelegate,UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return category.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cellcategory",for: indexPath)
        cell.textLabel?.text = category[indexPath.row]
        return cell
    }
}

