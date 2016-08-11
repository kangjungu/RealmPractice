//
//  AddDataController.swift
//
//
//  Created by JHJG on 2016. 4. 3..
//
//

import UIKit

class AddDataController: UIViewController {
    
    @IBOutlet weak var name: UITextField!
    @IBOutlet weak var age: UITextField!

    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    @IBAction func onAddClick(sender: UIButton) {
        let p: Person = Person();
        p.name = name.text!
        p.age = age.text!
        
        DBManager.instance.add(p)
        
        navigationController?.popViewControllerAnimated(true)
        
        
    }
    
    
}
