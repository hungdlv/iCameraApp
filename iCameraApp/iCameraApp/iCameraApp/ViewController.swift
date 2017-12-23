//
//  ViewController.swift
//  iCameraApp
//
//  Created by Macbook on 12/23/17.
//  Copyright © 2017 Macbook. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    
    var productArray = [Product]()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        tableView.dataSource = self
        
        productArray = [
            Product(name: "Iphone 5", price: "5 trieu", image: #imageLiteral(resourceName: "Iphone5")),
            Product(name: "Iphone 6", price: "6 trieu", image: #imageLiteral(resourceName: "Iphone6")),
            Product(name: "Iphone 6 Plus", price: "6.5 trieu", image: #imageLiteral(resourceName: "Iphone6")),
            Product(name: "Iphone 7", price: "7 trieu", image: #imageLiteral(resourceName: "Iphone6")),
            Product(name: "Iphone 8", price: "8 trieu", image: #imageLiteral(resourceName: "Iphone6"))
        ]
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

extension ViewController:UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return productArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        
        let product = productArray[indexPath.row]
        cell.textLabel?.text = product.name
        cell.detailTextLabel?.text = product.price
        cell.imageView?.image = product.image
        
        return cell
    }
}






