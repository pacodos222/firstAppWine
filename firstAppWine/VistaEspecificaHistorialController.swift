//
//  VistaEspecificaHistorialController.swift
//  firstAppWine
//
//  Created by Medina on 19/1/19.
//  Copyright © 2019 ual.es. All rights reserved.
//

import UIKit

var tipoWine : String = ""

class VistaEspecificaHistorialController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var lblTipoVino: UILabel!
    @IBOutlet weak var tabla: UITableView!
    
    var wine : Cata?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        lblTipoVino.text = "Vino " + tipoWine
        self.view.backgroundColor = UIColor(patternImage: UIImage(named:"fondo")!)
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("VistaEspecificaTableViewCell", forIndexPath: indexPath)
        cell.textLabel?.text = "A"
        
        return cell
    }
    
 
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        
            let controller = segue.destinationViewController as! HistorialVinoTableViewController
            
            if(tipoWine == "Tinto"){
                controller.vinoSeleccionado = "tinto"
            }
        
            if(tipoWine == "Blanco"){
                controller.vinoSeleccionado = "blanco"
            }
        
            if(tipoWine == "Rosado"){
                controller.vinoSeleccionado = "rosado"
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
