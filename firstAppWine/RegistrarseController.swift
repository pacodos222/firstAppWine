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
        
        registro(nombreUser.text!, contra: contrasena.text!,repC: repContrasena.text!)
        
    }
    
   
    func registro(nombre: String, contra: String, repC: String)
    {
        
        let appDelegate = UIApplication.sharedApplication().delegate as! AppDelegate
        let managedContext = appDelegate.managedObjectContext
        let entity = NSEntityDescription.entityForName("Usuario", inManagedObjectContext: managedContext)
        
        let item = NSManagedObject(entity: entity!, insertIntoManagedObjectContext: managedContext)
        
        if(listaUsers.contains(nombre)){
        
            let alerta = UIAlertController(title:"Error", message: "Ya existe un usuario con este nombre",
                                           preferredStyle: UIAlertControllerStyle.Alert)
            
            let accion = UIAlertAction(title: "OK",
                                       style: UIAlertActionStyle.Default) {
                                        _ in alerta.dismissViewControllerAnimated(true, completion: nil)
            self.nombreUser.text = "";
            }
            
            alerta.addAction(accion)
            self.presentViewController(alerta, animated:true, completion: nil)
    }
    
        
        //Comprobamos que la repeticion de contraseña sea igual
        if((contra == repC && contra.isEmpty == false && repC.isEmpty == false))
        {
            item.setValue(nombre, forKey: "username")
            item.setValue(contra, forKey: "password")
            
            do{
                try managedContext.save()
                objeto.append(item as! Usuario)
            } catch {
                print ("Error")
            }
        }
        else
        {
            let alerta = UIAlertController(title:"Error", message: "No coinciden la contraseña o los campos están vacíos",
                                           preferredStyle: UIAlertControllerStyle.Alert)
            
            let accion = UIAlertAction(title: "OK",
                                       style: UIAlertActionStyle.Default) {
                                        _ in alerta.dismissViewControllerAnimated(true, completion: nil)
            }
            
            alerta.addAction(accion)
            self.presentViewController(alerta, animated:true, completion: nil)
            self.contrasena.text = ""
            self.repContrasena.text = ""
        }
        //Podemos poner una alerta avisando que la rep de contraseña ya está
        //Tambien podemos poner otra alerta avisando de que el user ya está
        
        
     
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
