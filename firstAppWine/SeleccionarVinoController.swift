//
//  SeleccionarVinoController.swift
//  firstAppWine
//
//  Created by Aula11 on 17/12/18.
//  Copyright © 2018 ual.es. All rights reserved.
//

import UIKit
import CoreData

class SeleccionarVinoController: UIViewController {

    @IBOutlet weak var labelNuevaCata: UILabel!
    
    var vino : Vino?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
          self.view.backgroundColor = UIColor(patternImage: UIImage(named:"fondo")!)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    //Cada una de las siguientes acciones están asociadas al botón Seleccionar de la vista
    
    @IBAction func seleccionarTinto(sender: UIButton) {
        vino?.claseEstimada = "tinto"
        vino?.claseReal = "tinto"
        almacenarVinoBD()
        comprobarVinoBD()
        comprobarCataBD()

    }
    
    @IBAction func seleccionarRosado(sender: UIButton) {
        vino?.claseEstimada = "rosado"
        vino?.claseReal = "rosado"
        almacenarVinoBD()
        comprobarVinoBD()
        comprobarCataBD()

    }
    
    @IBAction func seleccionarBlanco(sender: UIButton) {
        vino?.claseEstimada = "blanco"
        vino?.claseReal = "blanco"
        almacenarVinoBD()
        comprobarVinoBD()
        comprobarCataBD()
    }
    
    func almacenarVinoBD(){
        let appDelegate = UIApplication.sharedApplication().delegate as! AppDelegate
        let managedContext = appDelegate.managedObjectContext
        let entidadVino = NSEntityDescription.entityForName("Vino", inManagedObjectContext: managedContext)
        let entidadCata = NSEntityDescription.entityForName("Cata", inManagedObjectContext: managedContext)
        let wine = Vino(entity: entidadVino!, insertIntoManagedObjectContext: managedContext)
        let cata = Cata(entity: entidadCata!, insertIntoManagedObjectContext: managedContext)
        wine.setValue(vino?.alcalinityOfAsh, forKey: "alcalinityOfAsh")
        wine.setValue(vino?.alcohol, forKey: "alcohol")
        wine.setValue(vino?.ash, forKey: "ash")
        wine.setValue(vino?.claseEstimada, forKey: "claseEstimada")
        wine.setValue(vino?.claseReal, forKey: "claseReal")
        wine.setValue(vino?.colorIntensitiy, forKey: "colorIntensitiy")
        wine.setValue(vino?.flavonoids, forKey: "flavonoids")
        wine.setValue(vino?.hue, forKey: "hue")
        wine.setValue(vino?.nonFlavonoidsPhenols, forKey: "nonFlavonoidsPhenols")
        wine.setValue(vino?.od280, forKey: "od280")
        wine.setValue(vino?.proanthocyanins, forKey: "proanthocyanins")
        wine.setValue(vino?.proline, forKey: "proline")
        cata.setValue(true, forKey: "resultado")
        cata.setValue("12/1/19", forKey: "fecha")

        do{
            try managedContext.save()
        }
        catch{
            print("DANGER in Almacenar")
        }

    }
    
    //muestran la cantidad que hay en la BD
    func comprobarVinoBD(){
        print("vamos a comprobar si esta almacenado el vino")
        let appDelegate = UIApplication.sharedApplication().delegate as! AppDelegate
        let managedContext = appDelegate.managedObjectContext
        let fetchRequest = NSFetchRequest(entityName: "Vino")
        do{
            let results = try managedContext.executeFetchRequest(fetchRequest)
            //print(results)
            print(results.count)
        }
        catch{
            print("FAIL")
        }

    }
    
    func comprobarCataBD(){
        print("vamos a comprobar si esta almacenado la Cata")
        let appDelegate = UIApplication.sharedApplication().delegate as! AppDelegate
        let managedContext = appDelegate.managedObjectContext
        let fetchRequest = NSFetchRequest(entityName: "Cata")
        do{
            let results = try managedContext.executeFetchRequest(fetchRequest)
            //print(results)
            print(results.count)
        }
        catch{
            print("FAIL")
        }

    }

    //Metodo que se acciona cuando se usa un segue
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if (segue.identifier == "seleccionarTintoSegue" || segue.identifier == "seleccionarRosadoSegue" || segue.identifier == "seleccionarBlancoSegue"){
            let controller = segue.destinationViewController as! ResultadoController
            controller.vino = vino

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
