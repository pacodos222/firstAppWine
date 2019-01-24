//
//  HistorialController.swift
//  firstAppWine
//
//  Created by Medina on 14/12/18.
//  Copyright © 2018 ual.es. All rights reserved.
//

import UIKit

class HistorialController: UIViewController {
    @IBOutlet weak var imgTinto: UIImageView!
    @IBOutlet weak var imgRosado: UIImageView!
    @IBOutlet weak var imgBlanco: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor(patternImage: UIImage(named:"fondo3")!)
        
        imgTinto.layer.borderWidth = 1.0
        imgTinto.layer.masksToBounds = false
        imgTinto.layer.borderColor = UIColor.blackColor().CGColor
        imgTinto.layer.cornerRadius = imgTinto.bounds.size.width / 4.0
        imgTinto.clipsToBounds = true
        
        imgRosado.layer.borderWidth = 1.0
        imgRosado.layer.masksToBounds = false
        imgRosado.layer.borderColor = UIColor.blackColor().CGColor
        imgRosado.layer.cornerRadius = imgRosado.bounds.size.width / 4.0
        imgRosado.clipsToBounds = true
        
        imgBlanco.layer.borderWidth = 1.0
        imgBlanco.layer.masksToBounds = false
        imgBlanco.layer.borderColor = UIColor.blackColor().CGColor
        imgBlanco.layer.cornerRadius = imgBlanco.bounds.size.width / 4.0
        imgBlanco.clipsToBounds = true
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
            tipoWine = "Tinto"
            
        }
        if(segue.identifier == "blancoHistorialSegue"){
            controller.vinoSeleccionado = "blanco"
            tipoWine = "Blanco"
        }
        if(segue.identifier == "rosadoHistorialSegue"){
            controller.vinoSeleccionado = "rosado"
            tipoWine = "Rosado"
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
