//
//  ViewController.swift
//  KirbyCollector
//
//  Created by Andrew VanDamme on 5/11/17.
//  Copyright © 2017 Andrew VanDamme. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var tableView: UITableView!
    
    var kirbys : [Kirby] = []
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        tableView.dataSource = self
        tableView.delegate = self
        
        
    }


    override func viewWillAppear(_ animated: Bool) {
        let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
        do {
            kirbys = try context.fetch(Kirby.fetchRequest())
            tableView.reloadData()
        } catch {
            
        }
        
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return kirbys.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        let kirby = kirbys[indexPath.row]
        cell.textLabel?.text = kirby.title
        cell.imageView?.image = UIImage(data: kirby.image as! Data)
        return cell
    }
    
}

