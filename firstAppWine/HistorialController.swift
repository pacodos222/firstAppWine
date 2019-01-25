//
//  HistorialController.swift
//  firstAppWine
//
//  Created by Medina on 14/12/18.
//  Copyright © 2018 ual.es. All rights reserved.
//

import UIKit

class HistorialController: UIViewController {
    @IBOutlet weak var imgTinto: UIImageView!
    @IBOutlet weak var imgRosado: UIImageView!
    @IBOutlet weak var imgBlanco: UIImageView!
    
    @IBOutlet weak var labelTinto: UILabel!
    
    @IBOutlet weak var labelRosado: UILabel!
    
    @IBOutlet weak var labelBlanco: UILabel!
    
   
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor(patternImage: UIImage(named:"fondo3")!)
        if(etiqueta == "App2"){
        calcularAcierto()
        }
        imgTinto.layer.borderWidth = 1.0
        imgTinto.layer.masksToBounds = false
        imgTinto.layer.borderColor = UIColor.blackColor().CGColor
        imgTinto.layer.cornerRadius = imgTinto.bounds.size.width / 4.0
        imgTinto.clipsToBounds = true
        
        imgRosado.layer.borderWidth = 1.0
        imgRosado.layer.masksToBounds = false
        imgRosado.layer.borderColor = UIColor.blackColor().CGColor
        imgRosado.layer.cornerRadius = imgRosado.bounds.size.width / 4.0
        imgRosado.clipsToBounds = true
        
        imgBlanco.layer.borderWidth = 1.0
        imgBlanco.layer.masksToBounds = false
        imgBlanco.layer.borderColor = UIColor.blackColor().CGColor
        imgBlanco.layer.cornerRadius = imgBlanco.bounds.size.width / 4.0
        imgBlanco.clipsToBounds = true
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
   func calcularAcierto(){
    var auxTinto = 0
    var catasTinto = 0
    var auxRosado = 0
    var catasRosado = 0
    var auxBlanco = 0
    var catasBlanco = 0
    var array = [Cata]()
    
    for p in (usuario?.usuarioCata)!   {
        
        array.append(p as! Cata)
    }
    
    
    for i in array{
            if(i.vinoCata!.claseReal == "tinto"){
                catasTinto += 1
                if(i.vinoCata?.claseReal == i.vinoCata?.claseEstimada){
                    auxTinto += 1
                }
            }
            if(i.vinoCata!.claseReal == "rosado"){
                catasRosado += 1
                if(i.vinoCata?.claseReal == i.vinoCata?.claseEstimada){
                    
                    auxRosado += 1
                }
            }
            if(i.vinoCata!.claseReal == "blanco"){
                catasBlanco += 1
                if(i.vinoCata?.claseReal == i.vinoCata?.claseEstimada){
                    auxBlanco += 1
                }
            }


        
    }
    if(catasTinto == 0){
        labelTinto.text = "0%"
    }else{
        let aux = Int(Double(auxTinto) / Double(catasTinto)*100)
        labelTinto.text = "\(aux)"+"%"
    }
    if(catasRosado == 0){
        labelRosado.text = "0%"
    }else{
        let aux = Int(Double(auxRosado) / Double(catasRosado)*100)
        labelRosado.text = "\(aux)"+"%"
    }
    if(catasBlanco == 0){
        labelBlanco.text = "0%"
    }else{
        let aux = Int(Double(auxBlanco) / Double (catasBlanco)*100)
        labelBlanco.text = "\(aux)"+"%"
        }
    }
    
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if((segue.identifier == "tintoHistorialSegue") || (segue.identifier == "blancoHistorialSegue") || (segue.identifier == "rosadoHistorialSegue")){
        
        let controller = segue.destinationViewController as! HistorialVinoTableViewController
        
        if(segue.identifier == "tintoHistorialSegue"){
            controller.vinoSeleccionado = "tinto"
            tipoWine = "Tinto"
            
        }
        if(segue.identifier == "blancoHistorialSegue"){
            controller.vinoSeleccionado = "blanco"
            tipoWine = "Blanco"
        }
        if(segue.identifier == "rosadoHistorialSegue"){
            controller.vinoSeleccionado = "rosado"
            tipoWine = "Rosado"
        }
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
