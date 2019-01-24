//
//  RegistrarseController.swift
//  firstAppWine
//
//  Created by Aula11 on 17/12/18.
//  Copyright © 2018 ual.es. All rights reserved.
//

import UIKit
import CoreData

class RegistrarseController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {

    @IBOutlet weak var nombreUser: UITextField!
    @IBOutlet weak var contrasena: UITextField!
    @IBOutlet weak var repContrasena: UITextField!
    @IBOutlet weak var foto: UIImageView!
    
    var objeto = [NSManagedObject]()
    var userImage = UIImage() 
    var listaUsers = [String]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        mostrar()
        self.view.backgroundColor = UIColor(patternImage: UIImage(named:"fondo3")!)    
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func seleccionarImagen(sender: UITapGestureRecognizer) {
        let imagePickerCtrl = UIImagePickerController()
        imagePickerCtrl.sourceType = .PhotoLibrary
        imagePickerCtrl.delegate = self
        presentViewController(imagePickerCtrl,animated: true, completion: nil)
    }
    
    func imagePickerControllerDidCancel(picker: UIImagePickerController) { dismissViewControllerAnimated(true, completion: nil)
    }
    
    func imagePickerController(picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : AnyObject]) {
        let selectedImage = info[UIImagePickerControllerOriginalImage] as! UIImage
        foto.image = selectedImage
        userImage = selectedImage
        dismissViewControllerAnimated(true, completion: nil)
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
    
        else{
        //Comprobamos que la repeticion de contraseña sea igual
        if((contra == repC && contra.isEmpty == false && repC.isEmpty == false))
        {
            let appDelegate = UIApplication.sharedApplication().delegate as! AppDelegate
            let managedContext = appDelegate.managedObjectContext
            let entity = NSEntityDescription.entityForName("Usuario", inManagedObjectContext: managedContext)
            
            let item = NSManagedObject(entity: entity!, insertIntoManagedObjectContext: managedContext)
            
            item.setValue(nombre, forKey: "username")
            //guardarImagen(userImage)
            //item.setValue(userImage, forKey: "imagen")
            item.setValue(contra, forKey: "password")
            
            
            
            let imageData = UIImagePNGRepresentation(userImage) as NSData?

             item.setValue(imageData, forKey: "imagen")
            
            
            
            
            
            
            
            
            do{
                try managedContext.save()
                objeto.append(item as! Usuario)
                let alerta2 = UIAlertController(title:"REGISTRO CORRECTO", message: "Se ha registrado correctamente",
                                                preferredStyle: UIAlertControllerStyle.Alert)
                
                let accion2 = UIAlertAction(title: "OK",
                                            style: UIAlertActionStyle.Default) {
                                                _ in alerta2.dismissViewControllerAnimated(true, completion: nil)
                                                self.performSegueWithIdentifier("backInicioSegue", sender: nil)
                                                
                }
                
                alerta2.addAction(accion2)
                self.presentViewController(alerta2, animated:true, completion: nil)
                
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
     
    }
    
    /*func guardarImagen(image: UIImage) {
        var results :[Any] = []
        

        let imageData = UIImagePNGRepresentation(image) as NSData?
        
       
        
        let appDelegate = UIApplication.sharedApplication().delegate as! AppDelegate
        
        
        // 1
        let managedContext = appDelegate.managedObjectContext
        
        // 2
        let entity =
            NSEntityDescription.entityForName("Usuario",
                                       inManagedObjectContext: managedContext)!
        
        let person = NSManagedObject(entity: entity,
                                     insertIntoManagedObjectContext: managedContext)
        
        // 3
        //print(image)
        person.setValue(imageData, forKeyPath: "imagen")
        
        // 4
        do {
            try managedContext.save()
            results.append(person)
            
            
        } catch let error as NSError {
            print("Could not save. \(error), \(error.userInfo)")
        }
    }
    */
    
    func mostrar() {
        let appDelegate = UIApplication.sharedApplication().delegate as! AppDelegate
        let managedContext = appDelegate.managedObjectContext
        let fetchRequest = NSFetchRequest(entityName: "Usuario")
        do{
            let results = try managedContext.executeFetchRequest(fetchRequest)
            for p in results {
                listaUsers.append(p.valueForKey("username") as! String)
            }
            //print(listaUsers)
        }
        catch{
           // print("FAIL")
        }
    }


}
