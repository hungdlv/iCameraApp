//
//  AddNewViewController.swift
//  iCameraApp
//
//  Created by Macbook on 12/23/17.
//  Copyright © 2017 Macbook. All rights reserved.
//

import UIKit

class AddNewViewController: UIViewController {

    @IBOutlet weak var imageView: UIImageView!
    
    @IBOutlet weak var productName: UITextField!
    
    @IBOutlet weak var productPrice: UITextField!
    
    let pickerPhoto:UIImagePickerController =  UIImagePickerController()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    @IBAction func addNewAction(_ sender: Any) {
        
    }
    
    
    @IBAction func selectionPhoto(_ sender: Any) {
        choosePhoto()
    }
    
    func choosePhoto() {
        if UIImagePickerController.isSourceTypeAvailable(.photoLibrary){
            pickerPhoto.sourceType = .photoLibrary
            self.present(pickerPhoto, animated: true, completion: nil)
        }
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
