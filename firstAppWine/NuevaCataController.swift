//
//  NuevaCataController.swift
//  firstAppWine
//
//  Created by Aula11 on 10/12/18.
//  Copyright © 2018 ual.es. All rights reserved.
//

import UIKit
import CoreData

var vino : Vino?
var cata : Cata?


class NuevaCataController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var slider: UISlider!
    @IBOutlet weak var picker: UIPickerView!
    @IBOutlet weak var labelSlider: UILabel!
    @IBOutlet weak var atributoLabel: UILabel!
    @IBOutlet weak var tabla: UITableView!
    
    var pickerData: [String] = [String]()
    let fecha = ""
    var selectedValue = ""
    var celdaMod = 0
    var valorAux = 0
    var data = ["Alcalinity", "Alcohol", "Ash", "Color intensity", "Flavonoids", "Hue", "Non flavonoids Phenols", "Od280", "Proanthocyanins", "Proline"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        pickerData = ["Alcalinity", "Alcohol", "Ash", "Color intensity", "Flavonoids", "Hue", "Non flavonoids Phenols", "Od280", "Proanthocyanins", "Proline"]
       
        self.picker.delegate = self
        self.picker.dataSource = self
        labelSlider.text = "0"
        self.view.backgroundColor = UIColor(patternImage: UIImage(named:"fondo")!)
        inicializarVino()
        inicializarCata()
        cata?.fecha = getFecha()
        cata?.resultado = true
             
        
    }
    
    func getFecha() -> String{
        let date = NSDate()
        let calendar = NSCalendar.currentCalendar()
        
        let year = calendar.component(.Year, fromDate: date)
        let month = calendar.component(.Month, fromDate: date)
        let day = calendar.component(.Day, fromDate: date)
        
        return "\(day)" + "/"+"\(month)"+"/"+"\(year)"
    }
    
    func inicializarVino(){
        let appDelegate = UIApplication.sharedApplication().delegate as! AppDelegate
        let managedContext = appDelegate.managedObjectContext
        let entity = NSEntityDescription.entityForName("Vino", inManagedObjectContext: managedContext)
        vino = Vino(entity: entity!, insertIntoManagedObjectContext: managedContext)
    }
    
    func inicializarCata(){
        let appDelegate = UIApplication.sharedApplication().delegate as! AppDelegate
        let managedContext = appDelegate.managedObjectContext
        let entity = NSEntityDescription.entityForName("Cata", inManagedObjectContext: managedContext)
        cata = Cata(entity: entity!, insertIntoManagedObjectContext: managedContext)
        hacerRelacion()
    }

    func hacerRelacion(){
        
        usuario!.setValue(NSSet(object: cata!), forKey: "usuarioCata")
        cata!.setValue(vino!, forKey: "vinoCata")
        
        
        
        mostrarResult()
    }
    
    func mostrarResult(){
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

    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    //Number of colums of data
    func numberOfComponentsInPickerView(pickerView: UIPickerView) -> Int {
        return 1
    }
    
    //The number of rows of data
    func pickerView(pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return pickerData.count
    }
    
    //The data to return for the row and component (colum) that´s beign passed in
    func pickerView(pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return pickerData[row]
    }
    
    //Capture the picker view selection
    func pickerView(pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        
        selectedValue = pickerData[row]
        
        switch selectedValue{
        case "Alcalinity":
            celdaMod = 0
            sliderDinamico(5)
            valorSlider(slider)
            vino?.alcalinityOfAsh = slider.value
            scroll(celdaMod)
            
        case "Alcohol":
            celdaMod = 1
            sliderDinamico(6)
            valorSlider(slider)
            vino?.alcohol = slider.value
            scroll(celdaMod)
            
        case "Ash":
            celdaMod = 2
            sliderDinamico(7)
            valorSlider(slider)
            vino?.ash = slider.value
            scroll(celdaMod)
            
        case "Color intensity":
            celdaMod = 3
            sliderDinamico(8)
            valorSlider(slider)
            vino?.colorIntensitiy = slider.value
            scroll(celdaMod)
            
        case "Flavonoids":
            celdaMod = 4
            sliderDinamico(9)
            valorSlider(slider)
            vino?.flavonoids = slider.value
            scroll(celdaMod)
            
        case "Hue":
            celdaMod = 5
            sliderDinamico(10)
            valorSlider(slider)
            vino?.hue = slider.value
            scroll(celdaMod)
            
        case "Non flavonoids Phenols":
            celdaMod = 6
            sliderDinamico(11)
            valorSlider(slider)
            vino?.nonFlavonoidsPhenols = slider.value
            scroll(celdaMod)
            
        case "Od280":
            celdaMod = 7
            sliderDinamico(12)
            valorSlider(slider)
            vino?.od280 = slider.value
            scroll(celdaMod)
            
        case "Proanthocyanins":
            celdaMod = 8
            sliderDinamico(13)
            valorSlider(slider)
            vino?.proanthocyanins = slider.value
            scroll(celdaMod)
            
        case "Proline":
            celdaMod = 9
            sliderDinamico(14)
            valorSlider(slider)
            vino?.proline = slider.value
            scroll(celdaMod)
            
        default:
            print("ERROR")
        }
        
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCellWithIdentifier("NuevaCataTableViewCell", forIndexPath: indexPath)
        cell.textLabel?.text = data[indexPath.item]
        
        switch selectedValue{
        case "Alcalinity":
            vino?.alcalinityOfAsh = slider.value
            
        case "Alcohol":
            vino?.alcohol = slider.value
            
        case "Ash":
            vino?.ash = slider.value
            
        case "Color intensity":
            vino?.colorIntensitiy = slider.value
            
        case "Flavonoids":
            vino?.flavonoids = slider.value
     
        case "Hue":
            vino?.hue = slider.value
            
        case "Non flavonoids Phenols":
            vino?.nonFlavonoidsPhenols = slider.value
        
        case "Od280":
            vino?.nonFlavonoidsPhenols = slider.value
            
        case "Proanthocyanins":
            vino?.nonFlavonoidsPhenols = slider.value
    
        case "Proline":
            vino?.proline = slider.value
            
        default:
            print("ERROR")
        }
        
        return cell
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return pickerData.count
    }
    
    @IBAction func actualizarTabla(sender: UISlider) {
        tablaDeBien(celdaMod)
        labelSlider.text = "\(slider.value)"
        data[celdaMod] = selectedValue + " \(slider.value)"
    }
    
    func tablaDeBien(celda: Int){
        let indexPath = NSIndexPath(forRow: celda, inSection: 0)
        tabla.reloadRowsAtIndexPaths([indexPath], withRowAnimation: UITableViewRowAnimation.Top)
    }

    func scroll(celda: Int){
        let indexPath = NSIndexPath(forRow: celda, inSection: 0)
        tabla.scrollToRowAtIndexPath(indexPath, atScrollPosition: UITableViewScrollPosition.Middle, animated: true)
    }
    
    @IBAction func valorSlider(sender: UISlider) {
    }
    
    
    func sliderDinamico(maximo : Float){
        
        slider.value = 0
        slider.maximumValue = maximo
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
