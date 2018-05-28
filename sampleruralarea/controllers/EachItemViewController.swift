//
//  EachItemViewController.swift
//  sampleruralarea
//
//  Created by Ron Rith on 5/24/18.
//  Copyright © 2018 Ron Rith. All rights reserved.
//

import UIKit

class EachItemViewController: UIViewController {
    @IBOutlet weak var eachItemTableView: UITableView!
    
    var eachItems: [[String:String]] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setDataToEachItem()
        eachItemTableView.delegate = self
        eachItemTableView.dataSource = self
    }
    func setDataToEachItem(){
        eachItems = [["Num1":"OneWelcome"],["Num2":"TwoWelcome"]]
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

}

extension EachItemViewController: UITableViewDelegate,UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return eachItems.count
    }
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell(style: UITableViewCellStyle.default, reuseIdentifier: nil)
        cell.textLabel?.text = eachItems[indexPath.row]["Num2"]
        
        return cell
    }


}
