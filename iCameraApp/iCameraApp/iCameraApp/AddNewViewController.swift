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
        let alert:UIAlertController = UIAlertController(title: "Chọn hình", message: nil, preferredStyle: .actionSheet)
        
        let library:UIAlertAction = UIAlertAction(title: "Choose from library", style: .default) { (action) in
            self.choosePhoto(sourceType: .photoLibrary)
        }
        
        let camera:UIAlertAction = UIAlertAction(title: "Take photo", style: .default) { (action) in
            self.choosePhoto(sourceType: .camera)
        }
        
        let cancel:UIAlertAction = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)
        
        alert.addAction(library)
        alert.addAction(camera)
        alert.addAction(cancel)
        self.present(alert, animated: true, completion: nil)
    }
    
    func choosePhoto(sourceType:UIImagePickerControllerSourceType) {
        if UIImagePickerController.isSourceTypeAvailable(sourceType){
            pickerPhoto.allowsEditing = true
            pickerPhoto.sourceType = sourceType
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
