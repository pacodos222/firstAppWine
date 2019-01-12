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
        
        print("\(vino)" + "AAAAAAAAA")
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func seleccionarTinto(sender: UIButton) {
        vino?.claseEstimada = "tinto"
        vino?.claseReal = "tinto"
        almacenarVinoBD()
        comprobarVinoBD()

    }
    
    @IBAction func seleccionarRosado(sender: UIButton) {
        vino?.claseEstimada = "rosado"
        vino?.claseReal = "rosado"
        almacenarVinoBD()
        comprobarVinoBD()

    }
    
    @IBAction func seleccionarBlanco(sender: UIButton) {
        vino?.claseEstimada = "blanco"
        vino?.claseReal = "blanco"
        almacenarVinoBD()
        comprobarVinoBD()
    }
    
    func almacenarVinoBD(){
        let appDelegate = UIApplication.sharedApplication().delegate as! AppDelegate
        let managedContext = appDelegate.managedObjectContext
        let entidadVino = NSEntityDescription.entityForName("Vino", inManagedObjectContext: managedContext)
        let wine = Vino(entity: entidadVino!, insertIntoManagedObjectContext: managedContext)
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

        do{
            try managedContext.save()
        }
        catch{
            print("DANGER in Fecha")
        }

    }
    
    
    func comprobarVinoBD(){
        print("vamos a comprobar si esta almacenado...")
        let appDelegate = UIApplication.sharedApplication().delegate as! AppDelegate
        let managedContext = appDelegate.managedObjectContext
        let fetchRequest = NSFetchRequest(entityName: "Vino")
        do{
            let results = try managedContext.executeFetchRequest(fetchRequest)
            /*for p in results {
                listaVinos.append(p.valueForKey("username") as! String)
            }
            print(listaVinos)*/
            print(results)
        }
        catch{
            print("FAIL")
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
