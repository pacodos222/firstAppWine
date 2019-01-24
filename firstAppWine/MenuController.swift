//
//  ViewController.swift
//  firstAppWine
// 
//  Created by Aula11 on 10/12/18.
//  Copyright © 2018 ual.es. All rights reserved.
//

import UIKit

class MenuController: UIViewController {
    

    @IBOutlet weak var userLabel: UILabel!
    
    @IBOutlet weak var imageUser: UIImageView!
    
    
    override func viewDidLoad() { 
        super.viewDidLoad()
        //print("se va a imprimir la imagen")
        //print(usuario?.imagen)
        //print("imagen impresa")
        print(etiqueta);
        if(usuario?.imagen == nil){
            self.imageUser.image = UIImage(named: "prueba")
        }else{
            self.imageUser.image = UIImage(data: (usuario?.imagen)!)
        }

        imageUser.layer.borderWidth = 1.0
        imageUser.layer.masksToBounds = false
        imageUser.layer.borderColor = UIColor.blackColor().CGColor
        imageUser.layer.cornerRadius = imageUser.bounds.size.width / 2.0
        imageUser.clipsToBounds = true
        
        
        userLabel.text = usuario?.username
        //print(usuario?.imagen)
        self.view.backgroundColor = UIColor(patternImage: UIImage(named:"fondo3")!)
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    

  
  


}

