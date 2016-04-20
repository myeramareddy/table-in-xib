//
//  SimpleCustomView.swift
//  XibTable
//
//  Created by Manisha Yeramareddy on 4/19/16.
//  Copyright © 2016 Manisha Yeramareddy. All rights reserved.
//


import UIKit

@IBDesignable class SimpleCustomView : UIView {
    var view:UIView!
    
    @IBOutlet weak var lblTitle: UILabel!
    @IBOutlet weak var tableView: UITableView!
    
   @IBInspectable var lblTitleText : String? {
        get {
            return lblTitle.text;
        }
        set(lblTitleText) {
            lblTitle.text = lblTitleText!;
        }
    }

    override init(frame: CGRect) {
        super.init(frame: frame)
        loadViewFromNib ()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        loadViewFromNib ()
    }
    
    func loadViewFromNib() {
        let bundle = NSBundle(forClass: self.dynamicType)
        let nib = UINib(nibName: "SimpleCustomView", bundle: bundle)
        let view = nib.instantiateWithOwner(self, options: nil)[0] as! UIView
        view.frame = bounds
        view.autoresizingMask = [.FlexibleWidth, .FlexibleHeight]
        self.addSubview(view);



    }

    
}