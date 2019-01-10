//
//  NuevaCataController.swift
//  firstAppWine
//
//  Created by Aula11 on 10/12/18.
//  Copyright © 2018 ual.es. All rights reserved.
//

import UIKit

class NuevaCataController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var slider: UISlider!
    
    @IBOutlet weak var picker: UIPickerView!
    
    @IBOutlet weak var labelSlider: UILabel!
    
    @IBOutlet weak var atributoLabel: UILabel!
    
    @IBOutlet weak var tabla: UITableView!
    
  
    
    
    var pickerData: [String] = [String]()
    
    var vino: Vino!
    
    var selectedValue = ""
    
    var celdaMod = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
                pickerData = ["Alcalinity", "Alcohol", "Ash", "Color intensity", "Flavonoids", "Hue", "Non flavonoids Phenols", "Od280", "Proanthocyanins", "Proline"]
        
        self.picker.delegate = self
        
        self.picker.dataSource = self
        
        labelSlider.text = "0"

        self.view.backgroundColor = UIColor(patternImage: UIImage(named:"fondo")!)
        
        
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
        //pickerData[picker.selectedRowInComponent(picker.selectedRowInComponent(row))]
        
         switch selectedValue{
        case "Alcalinity":
            sliderDinamico(5)
            valorSlider(slider)
            celdaMod = 0
            
           
        case "Alcohol":
            sliderDinamico(6)
             valorSlider(slider)
            celdaMod = 1
        
         case "Ash":
            sliderDinamico(7)
             valorSlider(slider)
            celdaMod = 2
            
         case "Color intensity":
            sliderDinamico(8)
            valorSlider(slider)
            celdaMod = 3
            
         case "Flavonoids":
            sliderDinamico(9)
             valorSlider(slider)
            
         case "Hue":
            sliderDinamico(10)
             valorSlider(slider)
            
         case "Non flavonoids Phenols":
            sliderDinamico(11)
             valorSlider(slider)
            
         case "Od280":
            sliderDinamico(12)
             valorSlider(slider)

         case "Proanthocyanins":
            sliderDinamico(13)
             valorSlider(slider)

         case "Proline":
            sliderDinamico(14)
             valorSlider(slider)





        default:
            print("ERROR")
        }

    }
    
   
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("NuevaCataTableViewCell", forIndexPath: indexPath)
        cell.textLabel?.text = "\(slider.value)"
        return cell
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }
    
    
    @IBAction func actualizarTabla(sender: UISlider) {
        tablaDeMierda(celdaMod)
    }
    
    func tablaDeMierda(celda: Int){
        let indexPath = NSIndexPath(forRow: celda, inSection: 0)
         tabla.reloadRowsAtIndexPaths([indexPath], withRowAnimation: UITableViewRowAnimation.Top)

    }
    

    @IBAction func valorSlider(sender: UISlider) {
        labelSlider.text = "\(slider.value)"
        
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
