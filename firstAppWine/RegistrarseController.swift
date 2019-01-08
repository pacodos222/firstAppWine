//
//  RegistrarseController.swift
//  firstAppWine
//
//  Created by Aula11 on 17/12/18.
//  Copyright © 2018 ual.es. All rights reserved.
//

import UIKit
import CoreData

class RegistrarseController: UIViewController {

    @IBOutlet weak var nombreUser: UITextField!
    @IBOutlet weak var contrasena: UITextField!
    @IBOutlet weak var repContrasena: UITextField!
    @IBOutlet weak var foto: UIImageView!
    
    var objeto = [NSManagedObject]()
    var listaUsers = [String]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        mostrar()
        self.view.backgroundColor = UIColor(patternImage: UIImage(named:"fondo")!)    }

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

   
    @IBAction func registrarse(sender: AnyObject) {
        
        registro(nombreUser.text!, contra: contrasena.text!)
        
    }
    
   
    func registro(nombre: String, contra: String)
    {
        
        let appDelegate = UIApplication.sharedApplication().delegate as! AppDelegate
        let managedContext = appDelegate.managedObjectContext
        let entity = NSEntityDescription.entityForName("Usuario", inManagedObjectContext: managedContext)
        
        let item = NSManagedObject(entity: entity!, insertIntoManagedObjectContext: managedContext)
        
        item.setValue(nombre, forKey: "username")
        item.setValue(contra, forKey: "password")
        
        do{
            try managedContext.save()
            objeto.append(item as! Usuario)
        } catch {
            print ("Error")
        }
    }
    
    func mostrar() {
        let appDelegate = UIApplication.sharedApplication().delegate as! AppDelegate
        let managedContext = appDelegate.managedObjectContext
        let fetchRequest = NSFetchRequest(entityName: "Usuario")
        do{
            let results = try managedContext.executeFetchRequest(fetchRequest)
            for p in results {
                listaUsers.append(p.valueForKey("username") as! String)
            }
            print(listaUsers)
        }
        catch{
            print("FAIL")
        }
    }


}
