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

     var data2 = ["Alcohol","Color intensity","Flavonoids"];
    
    override func viewDidLoad() {
        super.viewDidLoad()
        pickerData = ["Alcalinity", "Alcohol", "Ash", "Color intensity", "Flavonoids", "Hue", "Non flavonoids Phenols", "Od280", "Proanthocyanins", "Proline"]
        if(etiqueta == "App2")
        {
            pickerData = ["Alcohol","Color intensity","Flavonoids"]
        }
        self.picker.delegate = self
        self.picker.dataSource = self
        labelSlider.text = "0"
        self.view.backgroundColor = UIColor(patternImage: UIImage(named:"fondo3")!)
        inicializarVino()
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
        let entity2 = NSEntityDescription.entityForName("Cata", inManagedObjectContext: managedContext)
        cata = Cata(entity: entity2!, insertIntoManagedObjectContext: managedContext)
        cata?.cataUsuario = usuario
        cata!.setValue(vino!, forKey: "vinoCata")
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
        if(etiqueta == "App1")
        {
            switch selectedValue{
        case "Alcalinity":
            celdaMod = 0
            sliderDinamico(10, maximo: 30)
            scroll(celdaMod)
            
        case "Alcohol":
            celdaMod = 1
            sliderDinamico(11, maximo: 15)
            scroll(celdaMod)
            
        case "Ash":
            celdaMod = 2
            sliderDinamico(1.37, maximo: 3.23)
            scroll(celdaMod)
            
        case "Color intensity":
            celdaMod = 3
            sliderDinamico(1.28, maximo: 13)
            scroll(celdaMod)
            
        case "Flavonoids":
            celdaMod = 4
            sliderDinamico(0.34, maximo: 5.08)
            scroll(celdaMod)
            
        case "Hue":
            celdaMod = 5
            sliderDinamico(0.48, maximo: 1.71)
            scroll(celdaMod)
            
        case "Non flavonoids Phenols":
            celdaMod = 6
            sliderDinamico(0.13, maximo: 0.66)
            scroll(celdaMod)
            
        case "Od280":
            celdaMod = 7
            sliderDinamico(1.27, maximo: 4)
            scroll(celdaMod)
            
        case "Proanthocyanins":
            celdaMod = 8
            sliderDinamico(0.41, maximo: 3.58)
            scroll(celdaMod)
            
        case "Proline":
            celdaMod = 9
            sliderDinamico(278, maximo: 1680)
           scroll(celdaMod)
            
        default:
            print(" ")
            }
        }
        else
        {
            switch selectedValue{
            case "Alcohol":
                celdaMod = 0
                sliderDinamico(11, maximo: 15)
           
            case "Color intensity":
                celdaMod = 1
                sliderDinamico(1.28, maximo: 13)
                
            case "Flavonoids":
                celdaMod = 2
                sliderDinamico(0.34, maximo: 5.08)
                
            default:
                print("")
            }

        }
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
       let cell = tableView.dequeueReusableCellWithIdentifier("NuevaCataTableViewCell", forIndexPath: indexPath)
        if(etiqueta == "App2")
        {
            cell.textLabel?.text = data2[indexPath.item]
        }else {
        cell.textLabel?.text = data[indexPath.item]
        }
        
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
            print("")
        }
        
        return cell
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return pickerData.count
    }
    
    @IBAction func actualizarTabla(sender: UISlider) {
        refrescarTabla(celdaMod)
        labelSlider.text = "\(slider.value)"
        if(etiqueta == "App2"){
            data2[celdaMod] = selectedValue + " \(slider.value)"

        }else{
        data[celdaMod] = selectedValue + " \(slider.value)"
        }
    }
    
    func refrescarTabla(celda: Int){
        let indexPath = NSIndexPath(forRow: celda, inSection: 0)
        tabla.reloadRowsAtIndexPaths([indexPath], withRowAnimation: UITableViewRowAnimation.Top)
    }

    func scroll(celda: Int){
        let indexPath = NSIndexPath(forRow: celda, inSection: 0)
        tabla.scrollToRowAtIndexPath(indexPath, atScrollPosition: UITableViewScrollPosition.Middle, animated: true)
    }
    

    func sliderDinamico(minimo: Float, maximo : Float){
        
        slider.value = 0
        slider.minimumValue = minimo
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
