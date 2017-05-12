//
//  KirbyViewController.swift
//  KirbyCollector
//
//  Created by Andrew VanDamme on 5/11/17.
//  Copyright © 2017 Andrew VanDamme. All rights reserved.
//

import UIKit

class KirbyViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {

    @IBOutlet weak var titleText: UITextField!
    @IBOutlet weak var imageView: UIImageView!
    
    var imagePicker = UIImagePickerController()
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        imagePicker.delegate = self
    }

    
    
       
    @IBAction func photosTapped(_ sender: Any) {
        
        imagePicker.sourceType = .photoLibrary
        
        present(imagePicker, animated: true, completion: nil)
        
    }

    
    @IBAction func cameraTapped(_ sender: Any) {
    }

    
    @IBAction func addTapped(_ sender: Any) {
    }
}
