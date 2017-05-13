//
//  KirbyViewController.swift
//  KirbyCollector
//
//  Created by Andrew VanDamme on 5/11/17.
//  Copyright © 2017 Andrew VanDamme. All rights reserved.
//

import UIKit

class KirbyViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    @IBOutlet weak var addupdate: UIButton!
    @IBOutlet weak var titleText: UITextField!
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var deleteButton: UIButton!
    
    var imagePicker = UIImagePickerController()
    var kirby : Kirby? = nil
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        imagePicker.delegate = self
        
        if kirby != nil {
            imageView.image = UIImage(data: kirby!.image as! Data)
            titleText.text = kirby!.title
            
            addupdate.setTitle("Update", for: .normal)
            
        } else {
           
            deleteButton.isHidden = true
        }
        
    }
    
    
    
    
    @IBAction func photosTapped(_ sender: Any) {
        imagePicker.sourceType = .photoLibrary
        present(imagePicker, animated: true, completion: nil)
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        
        let image = info[UIImagePickerControllerOriginalImage] as! UIImage
        
        imageView.image = image
        
        //need the following to dismiss the photo album view once we pick an image
        imagePicker.dismiss(animated: true, completion: nil)
        
    }
    
    
    @IBAction func cameraTapped(_ sender: Any) {
        imagePicker.sourceType = .camera
        present(imagePicker, animated: true, completion: nil)
    }
    
    
    @IBAction func addTapped(_ sender: Any) {
        let titlecheck = titleText.text
        
        if kirby != nil {
            
            kirby!.title = titleText.text
            kirby!.image = UIImagePNGRepresentation(imageView.image!) as NSData?
            (UIApplication.shared.delegate as! AppDelegate).saveContext()
            navigationController!.popViewController(animated: true)
            
        } else if titlecheck == "" {
        
            print("Please add a title to continue")
        }
            
        else {
            let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
            let kbphoto = Kirby(context: context)
            kbphoto.title = titleText.text
            kbphoto.image = UIImagePNGRepresentation(imageView.image!) as NSData?
            (UIApplication.shared.delegate as! AppDelegate).saveContext()
            navigationController!.popViewController(animated: true)
        }
        
        
    }
    
    @IBAction func deleteTapped(_ sender: Any) {
        let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
        context.delete(kirby!)
        (UIApplication.shared.delegate as! AppDelegate).saveContext()
        navigationController!.popViewController(animated: true)
    }
}
