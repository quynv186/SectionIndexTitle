//
//  DetailVC.swift
//  SectionIndex
//
//  Created by QUYNV on 11/13/16.
//  Copyright © 2016 QUYNV. All rights reserved.
//

import UIKit

class DetailVC: UIViewController {
    
    var person = Person()
    var lblName = UILabel()
    var lblMobile = UILabel()
    var lblMobileNum = UILabel()
    var imgPhone = UIImageView()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.backgroundColor = UIColor.white
        self.lblName.frame = CGRect(x: 30, y: 100, width: 300, height: 50)
        self.lblName.font = UIFont.boldSystemFont(ofSize: 25)
        self.lblName.text = person.fullName
        
        self.view.addSubview(self.lblName)
        
        self.lblMobile.frame = CGRect(x: 30, y: 240, width: 100, height: 20)
        self.lblMobile.font = UIFont.systemFont(ofSize: 17)
        self.lblMobile.textColor = UIColor.blue
        self.lblMobile.text = "mobile"
        self.view.addSubview(lblMobile)
        
        self.lblMobileNum.frame = CGRect(x: 30, y: 250, width: 150, height: 50)
        self.lblMobileNum.font = UIFont.boldSystemFont(ofSize: 22)
        self.lblMobileNum.textColor = UIColor.black
        self.lblMobileNum.text = person.telephone
        self.view.addSubview(lblMobileNum)
        
        self.imgPhone.frame = CGRect(x: 270, y: 250, width: 80, height: 50)
        self.imgPhone.image = UIImage(named: "phone")
        self.view.addSubview(imgPhone)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
}
