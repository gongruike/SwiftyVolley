//
//  ViewController.swift
//  SwiftyVolley
//
//  Created by Ruike Gong on 04/17/2021.
//  Copyright (c) 2021 Ruike Gong. All rights reserved.
//

import UIKit
import SwiftyVolley

class ViewController: UIViewController {

    let requestQueue = RequestQueue()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func topBtnDidClicked(_ sender: Any) {
//        let stringRequest = StringRequest<Any>(baseURL: URL(string: "https://www.baidu.com")!, path: "")
//        requestQueue.add(stringRequest)
    }
    
}

