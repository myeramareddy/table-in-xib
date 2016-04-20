//
//  ViewController.swift
//  XibTable
//
//  Created by Manisha Yeramareddy on 4/19/16.
//  Copyright © 2016 Manisha Yeramareddy. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    var holderView : UIView!
    var customView : SimpleCustomView!
    
    @IBOutlet weak var label: UILabel!
    
    let data = ["one","two","three","four","five","six","seven"]

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    @IBAction func showButtonPressed(sender: AnyObject) {
        holderView = UIView(frame: self.view.frame)
        holderView.backgroundColor = UIColor.grayColor()
        holderView.alpha = 0.6
        self.view.addSubview(holderView)
        
        let screenWidth : CGFloat = self.view.frame.size.width
        let customViewWidth : CGFloat = screenWidth - 30
        
        //TODO - change customViewY so it's not always stuck to the top if the table view has many contents
        let customViewY : CGFloat = 0 + 30 //navigationBarY! + navigationBarHeight! + 5
        self.customView =  SimpleCustomView(frame: CGRectMake((screenWidth-customViewWidth)/2, customViewY, customViewWidth, 300))
        self.customView.layer.borderWidth = 0.8
        self.customView.layer.borderColor = UIColor.lightGrayColor().CGColor
        self.customView.layer.cornerRadius = 10
        self.customView.clipsToBounds = true
        
        self.customView.tableView.delegate = self
        self.customView.tableView.dataSource = self
        self.customView.tableView.reloadData()
        self.view.addSubview(self.customView!)
        
    }
    
    func dismissCustomView() {
        self.customView.removeFromSuperview()
        self.holderView.removeFromSuperview()
    }
    
    // MARK: - Table view data source
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        var cell = tableView.dequeueReusableCellWithIdentifier("MyTestCell")
        if(cell == nil) {
            cell = UITableViewCell(style: .Default, reuseIdentifier: "MyTestCell")
        }
        
        cell!.textLabel?.text = data[indexPath.row]
        cell!.textLabel?.textAlignment = NSTextAlignment.Center
        return cell!
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        //CODE TO BE RUN ON CELL TOUCH
        tableView.deselectRowAtIndexPath(indexPath, animated: true)
        
        label.text = "Selected - "+data[indexPath.row]
        dismissCustomView()
    }
    
    func tableView(tableView: UITableView, canEditRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        return false
    }
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

