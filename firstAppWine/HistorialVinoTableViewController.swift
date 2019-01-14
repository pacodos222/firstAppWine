//
//  HistorialVinoTableViewController.swift
//  firstAppWine
//
//  Created by Aula11 on 17/12/18.
//  Copyright © 2018 ual.es. All rights reserved.
//

import UIKit

class HistorialVinoTableViewController: UITableViewController {

    var resu = [Cata]()
    var vinoSeleccionado = ""
    var resuAux = [Cata]()
    var comprobar = false
    

    override func viewDidLoad() {
        super.viewDidLoad()
        print(vinoSeleccionado)
        for i in (usuario?.usuarioCata)!{
            resu.append(i as! Cata)
        }
        comprobarVino()
        
        self.view.backgroundColor = UIColor(patternImage: UIImage(named:"fondo")!)
        

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
        return resu.count
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return resu.count
    }

    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
       
        
        //comprobarVino()
        
        let cell = tableView.dequeueReusableCellWithIdentifier("celdaHistorial", forIndexPath: indexPath)
        
        if(comprobar == true){
            cell.textLabel?.text = resuAux[indexPath.item].fecha
        }else{
        cell.textLabel?.text = ""
        }
        return cell
    }
    
        func comprobarVino(){
            
        switch vinoSeleccionado {
            
        case "tinto":
            for cata in resu{
               let vinoAux = cata.vinoCata as! Vino
                if(vinoAux.claseReal == vinoSeleccionado ){
                    resuAux.append(cata)
                }
                if(resuAux.count != 0){
                comprobar = true
                }
            }
            
        case "blanco":
            for cata in resu{
                let vinoAux = cata.vinoCata as! Vino
                if(vinoAux.claseReal == vinoSeleccionado ){
                    resuAux.append(cata)
                }
                if(resuAux.count != 0){
                comprobar = true
                }
            }
            
        case"rosado":
            print("ABBAAAAABAWERQWEQWEQWEQWDQERQ")
                for cata in resu{
                    let vinoAux = cata.vinoCata as! Vino
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
