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
    
    var totalVinos : [String] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        lblTipoVino.text = "Vino " + tipoWine
        self.view.backgroundColor = UIColor(patternImage: UIImage(named:"fondo3")!)
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        var numeroRow = 0
        if(etiqueta == "App2"){
            numeroRow = 4
        } else {
            numeroRow = 11
        }
        return numeroRow
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        if(etiqueta == "App2")
        {
            cargarDatosSegundaApp()
        } else {
        cargarDatos()
        }
        let cell = tableView.dequeueReusableCellWithIdentifier("VistaEspecificaTableViewCell", forIndexPath: indexPath)
        cell.textLabel?.text = totalVinos[indexPath.row]
        return cell
    }
    
    func cargarDatos(){
        totalVinos.removeAll()
        totalVinos.append("Fecha: \t" + ((wine?.fecha))!)
        totalVinos.append("Alcalinity Of Ash\t" + ((wine?.vinoCata?.alcalinityOfAsh)?.stringValue)!)
        totalVinos.append("Alcohol\t" + ((wine?.vinoCata?.alcohol)?.stringValue)!)
        totalVinos.append("Ash\t" + ((wine?.vinoCata?.ash)?.stringValue)!)
        totalVinos.append("Color Intensity\t" + ((wine?.vinoCata?.colorIntensitiy)?.stringValue)!)
        totalVinos.append("Flavanoids\t" + ((wine?.vinoCata?.flavonoids)?.stringValue)!)
        totalVinos.append("Hue\t" + ((wine?.vinoCata?.hue)?.stringValue)!)
        totalVinos.append("Non Flavanoids Phenols\t" + ((wine?.vinoCata?.nonFlavonoidsPhenols)?.stringValue)!)
        totalVinos.append("OD280 \t" + ((wine?.vinoCata?.od280)?.stringValue)!)
        totalVinos.append("Proanthocyanins\t" + ((wine?.vinoCata?.proanthocyanins)?.stringValue)!)
        totalVinos.append("Proline\t" + ((wine?.vinoCata?.proline)?.stringValue)!)
    }
    
    func cargarDatosSegundaApp()
    {
        totalVinos.removeAll()
        totalVinos.append("Fecha: \t" + ((wine?.fecha))!)
        totalVinos.append("Alcohol\t" + ((wine?.vinoCata?.alcohol)?.stringValue)!)
        totalVinos.append("Color Intensity\t" + ((wine?.vinoCata?.colorIntensitiy)?.stringValue)!)
        totalVinos.append("Flavanoids\t" + ((wine?.vinoCata?.flavonoids)?.stringValue)!)
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
