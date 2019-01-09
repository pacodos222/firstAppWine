//
//  ViewController.swift
//  firstAppWine
//
//  Created by Aula11 on 10/12/18.
//  Copyright © 2018 ual.es. All rights reserved.
//

import UIKit

class MenuController: UIViewController {
    

    @IBOutlet weak var userLabel: UILabel!
    
    let dato = NSUserDefaults()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        userLabel.text = dato.objectForKey("user") as? String
        self.view.backgroundColor = UIColor(patternImage: UIImage(named:"fondo")!)
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
  
  


}

