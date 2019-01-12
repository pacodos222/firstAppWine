//
//  SeleccionarVinoController.swift
//  firstAppWine
//
//  Created by Aula11 on 17/12/18.
//  Copyright © 2018 ual.es. All rights reserved.
//

import UIKit

class SeleccionarVinoController: UIViewController {

    @IBOutlet weak var labelNuevaCata: UILabel!
    
    var vino : Vino?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
          self.view.backgroundColor = UIColor(patternImage: UIImage(named:"fondo")!)
        print("\(vino)" + "AAAAAAAAA")
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
