//
//  HistorialController.swift
//  firstAppWine
//
//  Created by Medina on 14/12/18.
//  Copyright © 2018 ual.es. All rights reserved.
//

import UIKit

class HistorialController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor(patternImage: UIImage(named:"fondo")!)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if((segue.identifier == "tintoHistorialSegue") || (segue.identifier == "blancoHistorialSegue") || (segue.identifier == "rosadoHistorialSegue")){
        
        let controller = segue.destinationViewController as! HistorialVinoTableViewController
        
        if(segue.identifier == "tintoHistorialSegue"){
            controller.vinoSeleccionado = "tinto"
            
        }
        if(segue.identifier == "blancoHistorialSegue"){
            controller.vinoSeleccionado = "blanco"
            
        }
        if(segue.identifier == "rosadoHistorialSegue"){
            controller.vinoSeleccionado = "rosado"
            
        }
        }
        
            
        
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
