//
//  ResultadoController.swift
//  firstAppWine
//
//  Created by Aula11 on 17/12/18.
//  Copyright © 2018 ual.es. All rights reserved.
//  

import UIKit
import CoreData

class ResultadoController: UIViewController {

    @IBOutlet weak var imagenSeleccionada: UIImageView!
    @IBOutlet weak var lblSeleccionado: UILabel!
    @IBOutlet weak var imagenCorrecta: UIImageView!
    @IBOutlet weak var lblCorrecta: UILabel!
        
    var comp : String = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print("vamos a comprobar si esta almacenado la relacion")
        let appDelegate = UIApplication.sharedApplication().delegate as! AppDelegate
        let managedContext = appDelegate.managedObjectContext
        let fetchRequest = NSFetchRequest(entityName: "Cata")
        do{
            let results = try managedContext.executeFetchRequest(fetchRequest)
            print(results)
            print(results.count)
        }
        catch{
            print("FAIL")
        }
        if(etiqueta == "App2"){
        arbol()
        }
        inicializarVista()
        
        let backgroundImage = UIImageView(frame: UIScreen.mainScreen().bounds)
        backgroundImage.image = UIImage(named: "fondo2")
        self.view.insertSubview(backgroundImage, atIndex: 0)
        self.view.backgroundColor = UIColor(patternImage: UIImage(named:"fondo3")!)
        
        imagenSeleccionada.layer.borderWidth = 1.0
        imagenSeleccionada.layer.masksToBounds = false
        imagenSeleccionada.layer.borderColor = UIColor.blackColor().CGColor
        imagenSeleccionada.layer.cornerRadius = imagenSeleccionada.bounds.size.width / 4.0
        imagenSeleccionada.clipsToBounds = true
        
        imagenCorrecta.layer.borderWidth = 1.0
        imagenCorrecta.layer.masksToBounds = false
        imagenCorrecta.layer.borderColor = UIColor.blackColor().CGColor
        imagenCorrecta.layer.cornerRadius = imagenCorrecta.bounds.size.width / 4.0
        imagenCorrecta.clipsToBounds = true

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    //Metodo que inicializa los labels y las imagenes
    func inicializarVista(){
        comp = (vino?.claseEstimada)!
        switch comp{
        case "tinto":
            lblSeleccionado.text = "Vino Tinto"
            
            if(etiqueta == "App1"){
            lblCorrecta.text = "Vino Tinto"
            imagenCorrecta.image = UIImage(named: "tinto")
            }
            
            imagenSeleccionada.image = UIImage(named: "tinto")
            
        case "blanco":
            lblSeleccionado.text = "Vino Blanco"
            
            if(etiqueta == "App1"){
            lblCorrecta.text = "Vino Blanco"
            imagenCorrecta.image = UIImage(named: "blanco")
            }
            
            imagenSeleccionada.image = UIImage(named: "blanco")
      
            
        case "rosado":
            lblSeleccionado.text = "Vino Rosado"
            
            if(etiqueta == "App1"){
            lblCorrecta.text = "Vino Rosado"
            imagenCorrecta.image = UIImage(named: "rosado")
            }
            
            imagenSeleccionada.image = UIImage(named: "rosado")
            
        default:
            print("ERROR")
        }
    }
    
    func arbol(){
        
        if(vino?.claseReal == "rosado"){
            lblCorrecta.text = "Vino Rosado"
            imagenCorrecta.image = UIImage(named: "rosado")
        }
        if(vino?.claseReal == "blanco"){
            lblCorrecta.text = "Vino Blanco"
            imagenCorrecta.image = UIImage(named: "blanco")
        }
        if(vino?.claseReal == "tinto"){
            lblCorrecta.text = "Vino Tinto"
            imagenCorrecta.image = UIImage(named: "tinto")
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
