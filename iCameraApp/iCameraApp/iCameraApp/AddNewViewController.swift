//
//  AddNewViewController.swift
//  iCameraApp
//
//  Created by Macbook on 12/23/17.
//  Copyright © 2017 Macbook. All rights reserved.
//

import UIKit



class AddNewViewController: UIViewController {
    
    weak var delegate:AddNewViewControllerDelegate?

    @IBOutlet weak var isAllowSavePhoto: UISwitch!
    
    @IBOutlet weak var imageView: UIImageView!
    
    @IBOutlet weak var productName: UITextField!
    
    @IBOutlet weak var productPrice: UITextField!
    
    let pickerPhoto:UIImagePickerController =  UIImagePickerController()
    
    var product:Product?
    var indexPath:IndexPath?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        if let product = self.product
        {
            productName.text = product.name
            productPrice.text = product.price
            imageView.image = product.image
        }
    }
    
    @IBAction func cancelAction(_ sender: Any) {
        let _ = self.navigationController?.popViewController(animated: true)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    @IBAction func addNewAction(_ sender: Any) {
        var product = Product(name: "", price: "", image: #imageLiteral(resourceName: "Iphone5"))
        product.name = productName.text!
        product.price = productPrice.text!
        
        if let productImg = imageView.image {
            product.image = productImg
            
            if let _ = self.product {
                self.product = product
                self.delegate?.userDidUpdateProduct(vc: self, product: self.product!, at: self.indexPath!)
            }else{
                self.delegate?.userDidCreateProduct(vc: self, product: product)
            }
            
            self.navigationController?.popToRootViewController(animated: true)
        }else{
            
        }
        
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
            
            //allow editing image
            pickerPhoto.allowsEditing = true
            
            //use delegate because this controller extention
            pickerPhoto.delegate = self
            
            //dymanic sourceType from a parameter input
            pickerPhoto.sourceType = sourceType
            
            //show photoLibrary
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


extension AddNewViewController : UIImagePickerControllerDelegate, UINavigationControllerDelegate{
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        if let image = info[UIImagePickerControllerOriginalImage] as? UIImage{
            //catch this image into imageView
            imageView.image = image
            
            //save the image into photoAlbum local
            if picker.sourceType == .camera && isAllowSavePhoto.isOn {
                UIImageWriteToSavedPhotosAlbum(image, nil, nil, nil)
            }
            
            //hide currView
            dismiss(animated: true, completion: nil)
        }
    }
}




