//
//  HistorialVinoTableViewController.swift
//  firstAppWine
//
//  Created by Aula11 on 17/12/18.
//  Copyright © 2018 ual.es. All rights reserved.
//

import UIKit
import CoreData

class HistorialVinoTableViewController: UITableViewController {

    var resu = [Cata]()
    var vinoSeleccionado = ""
    var resuAux = [Cata]()
    var comprobar = false
    

    override func viewDidLoad() {
        super.viewDidLoad()
        cargarUserBd()
        print(vinoSeleccionado)
        
        for i in (usuario?.usuarioCata)!{
            resu.append(i as! Cata)
        }
        
        print(resu.count)
        comprobarVino()
        
        self.view.backgroundColor = UIColor(patternImage: UIImage(named:"fondo3")!)
        

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
          // comprobarVino()
        if(comprobar == true){
        return resuAux.count
        }
        return 0
    }

    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
       
        
        //comprobarVino()
        
        let cell = tableView.dequeueReusableCellWithIdentifier("celdaHistorial", forIndexPath: indexPath)
        var label = ""
        if(comprobar == true){
            if(etiqueta == "App2"){
                if(resuAux[indexPath.item].vinoCata?.claseEstimada != resuAux[indexPath.item].vinoCata?.claseReal){
                    label = resuAux[indexPath.item].fecha! + "\t\t\t\tFallo! 👎"
                }else{
                     label = resuAux[indexPath.item].fecha! + "\t\t\t\tAcierto! 👍"
                }
            }else{
                label = resuAux[indexPath.item].fecha! + "\t\t\t\tAcierto! 👍"
            }
            cell.textLabel?.text = label
            cell.accessoryType = .DisclosureIndicator
        }else{
        cell.textLabel?.text = ""
        }
        return cell
    }
    
        func comprobarVino(){
            
        switch vinoSeleccionado {
            
        case "tinto":
            for cata in resu{
               let vinoAux = cata.vinoCata! as! Vino
                if(vinoAux.claseReal == vinoSeleccionado ){
                    resuAux.append(cata)
                }
                if(resuAux.count != 0){
                comprobar = true
                }
            }
            
        case "blanco":
            for cata in resu{
                let vinoAux = cata.vinoCata! as! Vino
                if(vinoAux.claseReal == vinoSeleccionado ){
                    resuAux.append(cata)
                }
                if(resuAux.count != 0){
                comprobar = true
                }
            }
            
        case"rosado":
                            for cata in resu{
                    let vinoAux = cata.vinoCata! as! Vino
                    if(vinoAux.claseReal == vinoSeleccionado ){
                        resuAux.append(cata)
                    }
                }
                if(resuAux.count != 0){
            comprobar = true
            }
        default:
            print("Error")

           

        }
            
    }
    
    
    
    func cargarUserBd() {
        let appDelegate = UIApplication.sharedApplication().delegate as! AppDelegate
        let managedContext = appDelegate.managedObjectContext
        let fetchRequest = NSFetchRequest(entityName: "Usuario")
        do{
            let results = try managedContext.executeFetchRequest(fetchRequest)
            for p in results {
                let userAux = p as! Usuario
                if(userAux.username == usuario?.username){
                    usuario = userAux
                }
            }
            
        }
        catch{
            print("FAIL")
        }
        
    }

    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "historialFechaSegue"{
            
            let celdaRef = sender as! UITableViewCell
            let destinoVC = segue.destinationViewController as! VistaEspecificaHistorialController
            let filaSeleccionada = tableView.indexPathForCell(celdaRef)
            destinoVC.wine = resuAux[(filaSeleccionada?.row)!]
        }
    }

    /*
    // Override to support conditional editing of the table view.
    override func tableView(tableView: UITableView, canEditRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        if editingStyle == .Delete {
            // Delete the row from the data source
            tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: .Fade)
        } else if editingStyle == .Insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(tableView: UITableView, moveRowAtIndexPath fromIndexPath: NSIndexPath, toIndexPath: NSIndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(tableView: UITableView, canMoveRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
