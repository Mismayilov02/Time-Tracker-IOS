//
//  ViewController.swift
//  Time Tracker
//
//  Created by mehemmed ismayilov on 11/7/22.
//

import UIKit
import CoreData

let appDelegate = UIApplication.shared.delegate as! AppDelegate

class ViewController: UIViewController {
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + 2 ) {
            self.performSegue(withIdentifier: "splash_to_runScreen", sender: nil)
        }
        // Do any additional setup after loading the view.
    }


}

