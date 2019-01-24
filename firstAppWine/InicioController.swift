//
//  InicioController.swift
//  firstAppWine
//
//  Created by Medina on 14/12/18.
//  Copyright © 2018 ual.es. All rights reserved.
//  

import UIKit
import CoreData

var usuario: Usuario?
var etiqueta: String?

class InicioController: UIViewController {
    
    
    
    
    @IBOutlet weak var usuarioTxt: UITextField!
    @IBOutlet weak var passTxt: UITextField!
    
    

    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        #if LPS1
            etiqueta = "App1"
        #else
            etiqueta = "App2"
        #endif

        self.view.backgroundColor = UIColor(patternImage: UIImage(named:"fondo3")!)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    @IBAction func autentificacion() {
        
        let appDelegate = UIApplication.sharedApplication().delegate as! AppDelegate
        let context = appDelegate.managedObjectContext
        let request = NSFetchRequest(entityName: "Usuario")
        let predicados = NSPredicate(format: "%K == %@ AND %K == %@", argumentArray: ["username", usuarioTxt.text!,"password", passTxt.text!])
        
        request.predicate = predicados
        
        
        do
        {
           let result = try context.executeFetchRequest(request) as! [NSManagedObject]
                       if result.count == 1
            {
                usuario = result[0] as! Usuario

                performSegueWithIdentifier("segueLogin", sender: self)
            }
            else
            {
                let alert = UIAlertController(title: "Error", message: "La clave introducida es incorrecta, por favor vuelva a introducirla", preferredStyle: .Alert)
                let accionOK = UIAlertAction(title: "Aceptar", style: .Default, handler: {(alert: UIAlertAction!) in print("Error de autentificacion")})
               
                alert.addAction(accionOK)
                self.presentViewController(alert, animated: true, completion: nil)
               
            }
        }
        catch
        {}
        
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