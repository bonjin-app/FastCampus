//
//  ViewController.swift
//  MyAlbum
//
//  Created by gigas on 2021/03/03.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    @IBAction func pressButton(_ sender: Any) {
        let alert = UIAlertController(title: "Hello", message: "My First App!", preferredStyle: .alert)
        let action = UIAlertAction(title: "확인", style: .default, handler: nil)
        
        alert.addAction(action)
        present(alert, animated: true, completion: nil)
    }
}

