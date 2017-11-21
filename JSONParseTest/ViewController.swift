//
//  ViewController.swift
//  JSONParseTest
//
//  Created by Selahattin Cincin on 21.11.2017.
//  Copyright © 2017 Selahattin Cincin. All rights reserved.
//


import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var paraBirimi: UITextField!
    @IBOutlet weak var sonuc: UITextField!
    @IBAction func deger(_ sender: Any) {
        
    }
    override func viewDidLoad()
    {
        super.viewDidLoad()
        
        let url = URL(string:"https://api.fixer.io/latest")
        let task = URLSession.shared.dataTask(with: url!) { (data,response,error) in
            if error != nil{
                print("ERROR")
            }
            else{
                if let content = data{
                    do{
                        //array
                        let myJson = try JSONSerialization.jsonObject(with: content, options: JSONSerialization.ReadingOptions.mutableContainers) as AnyObject
                        print(myJson)
                        
                    }
                    catch{
                        
                    }
                }
            }
            
        }
        task.resume()
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
    }
    
    
}

