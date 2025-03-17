//
//  ViewController.swift
//  MushiViewer
//
//  Created by Serrano Soria, Juan on 16/03/2025.
//

import UIKit

class ViewController: UIViewController {
    var pictures = [String]()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let fileManager = FileManager.default
        let path = Bundle.main.resourcePath!
        let items = try! fileManager.contentsOfDirectory(atPath: path)
        
        for item in items {
            if item.hasPrefix("insect") {
                pictures.append(item)
            }
        }
        
        print(pictures)
    }


}

