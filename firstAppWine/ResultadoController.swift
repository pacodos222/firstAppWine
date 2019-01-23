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

        inicializarVista()
        let backgroundImage = UIImageView(frame: UIScreen.mainScreen().bounds)
        backgroundImage.image = UIImage(named: "fondo2")
        self.view.insertSubview(backgroundImage, atIndex: 0)
        self.view.backgroundColor = UIColor(patternImage: UIImage(named:"fondo2")!)
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
            lblCorrecta.text = "Vino Tinto"
            imagenSeleccionada.image = UIImage(named: "tinto")
            imagenCorrecta.image = UIImage(named: "tinto")
            
        case "blanco":
            lblSeleccionado.text = "Vino Blanco"
            lblCorrecta.text = "Vino Blanco"
            imagenSeleccionada.image = UIImage(named: "blanco")
            imagenCorrecta.image = UIImage(named: "blanco")
            
        case "rosado":
            lblSeleccionado.text = "Vino Rosado"
            lblCorrecta.text = "Vino Rosado"
            imagenSeleccionada.image = UIImage(named: "rosado")
            imagenCorrecta.image = UIImage(named: "rosado")
        
        default:
            print("ERROR")
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
