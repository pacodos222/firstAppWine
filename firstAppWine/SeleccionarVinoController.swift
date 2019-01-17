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
        
    override func viewDidLoad() {
        super.viewDidLoad()
       // self.view.backgroundColor = UIColor(patternImage: UIImage(named:"fondo")!)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    //Cada una de las siguientes acciones están asociadas al botón Seleccionar de la vista
    @IBAction func seleccionarTinto(sender: UIButton) {
    }
    
    @IBAction func seleccionarRosado(sender: UIButton) {
    }
    
    @IBAction func seleccionarBlanco(sender: UIButton) {
    }
    
    //Metodo que almacena el vino y una nueva cata
    func almacenarVinoBD(){
        let appDelegate = UIApplication.sharedApplication().delegate as! AppDelegate
        let managedContext = appDelegate.managedObjectContext
  //      let entidadVino = NSEntityDescription.entityForName("Vino", inManagedObjectContext: managedContext)
    //    let entidadCata = NSEntityDescription.entityForName("Cata", inManagedObjectContext: managedContext)
   //     let wine = Vino(entity: entidadVino!, insertIntoManagedObjectContext: managedContext)
     //   let cata = Cata(entity: entidadCata!, insertIntoManagedObjectContext: managedContext)
        vino!.setValue(vino?.alcalinityOfAsh, forKey: "alcalinityOfAsh")
        vino!.setValue(vino?.alcohol, forKey: "alcohol")
        vino!.setValue(vino?.ash, forKey: "ash")
        vino!.setValue(vino?.claseEstimada, forKey: "claseEstimada")
        vino!.setValue(vino?.claseReal, forKey: "claseReal")
        vino!.setValue(vino?.colorIntensitiy, forKey: "colorIntensitiy")
        vino!.setValue(vino?.flavonoids, forKey: "flavonoids")
        vino!.setValue(vino?.hue, forKey: "hue")
        vino!.setValue(vino?.nonFlavonoidsPhenols, forKey: "nonFlavonoidsPhenols")
        vino!.setValue(vino?.od280, forKey: "od280")
        vino!.setValue(vino?.proanthocyanins, forKey: "proanthocyanins")
        vino!.setValue(vino?.proline, forKey: "proline")


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
        
        if (segue.identifier == "seleccionarTintoSegue" ){
            vino?.claseEstimada = "tinto"
            vino?.claseReal = "tinto"
            almacenarVinoBD()
            comprobarVinoBD()
            comprobarCataBD()
        }
        if ( segue.identifier == "seleccionarRosadoSegue" ){
            vino?.claseEstimada = "rosado"
            vino?.claseReal = "rosado"
            almacenarVinoBD()
            comprobarVinoBD()
            comprobarCataBD()
        }
        if ( segue.identifier == "seleccionarBlancoSegue"){
            vino?.claseEstimada = "blanco"
            vino?.claseReal = "blanco"
            almacenarVinoBD()
            comprobarVinoBD()
            comprobarCataBD()
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
