//
//  UserDataViewController.swift
//  RealmPractice
//
//  Created by JHJG on 2016. 4. 3..
//  Copyright © 2016년 KangJungu. All rights reserved.
//

import UIKit

//프로퍼티 매니저(데이터 간단히 저장하는것)
class UserDataViewController: UIViewController {

    @IBOutlet weak var mLabel1: UITextField!
    @IBOutlet weak var mLabel2: UITextField!
    
    
    var ud = NSUserDefaults()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        mLabel2.text = ud.stringForKey("key1")
        mLabel1.text = ud.stringForKey("key2")
        
    }

    @IBAction func onSaveClick(sender: UIButton) {
        ud.setValue(mLabel1.text, forKeyPath: "key1")
        ud.setValue(mLabel2.text, forKeyPath: "key2")
    }
}
