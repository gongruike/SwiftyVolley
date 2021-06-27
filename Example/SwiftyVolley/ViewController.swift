//
//  ViewController.swift
//  SwiftyVolley
//
//  Created by Ruike Gong on 04/17/2021.
//  Copyright (c) 2021 Ruike Gong. All rights reserved.
//

import UIKit
import SwiftyVolley
import Alamofire

extension Endpoint {
    static func home() -> Endpoint<Dictionary<String, String>> {
        .init(path: "telematics/v3/weather",
              method: .get,
              headers: [:],
              parameters: [
                "location":"嘉兴",
                "output":"json",
                "ak": "5slgyqGDENN7Sy7pw29IUvrZ"
              ]
        )
    }
}

class ViewController: UIViewController {

    lazy var apiClient: APIClient = {
       return APIClient(requestEncoder: DefaultRequestEncoder(baseURL: URL(string: "http://api.map.baidu.com/")!))
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func topBtnDidClicked(_ sender: Any) {
        ///
        apiClient.request(endpoint: .home()) { (result) in
            ///
            print(result)
        }
    }
    
}

