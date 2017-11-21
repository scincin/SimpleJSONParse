//
//  ViewController.swift
//  JSONParseTest
//
//  Created by Selahattin Cincin on 21.11.2017.
//  Copyright © 2017 Selahattin Cincin. All rights reserved.
//

import UIKit

struct Values: Decodable {
    let base: String
    let date: String
    let rates: [Rates]
}
struct Rates: Decodable {
    let TRY:Float?
}

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
         // Do any additional setup after loading the view, typically from a nib.
        
        let jsonUrlString = "https://api.fixer.io/latest"
        guard let url = URL(string: jsonUrlString) else { return }
        
        URLSession.shared.dataTask(with: url) { (data, response, err) in
        guard let data = data else {return}
        do{
                
            let money = try JSONDecoder().decode(Values.self, from: data)
            print(money.base)
            
            }catch let jsonErr{
                print("error json:", jsonErr)
                
                }
            }.resume()
       
    }

    


}

