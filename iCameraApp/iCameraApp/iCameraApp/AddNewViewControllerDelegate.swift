//
//  AddNewViewControllerDelegate.swift
//  iCameraApp
//
//  Created by Macbook on 12/23/17.
//  Copyright © 2017 Macbook. All rights reserved.
//

import Foundation

protocol  AddNewViewControllerDelegate:class {
    func userDidCreateProduct(vc:AddNewViewController, product:Product)
    
    func userDidUpdateProduct(vc:AddNewViewController, product:Product, at: IndexPath)
    
    func userDidCancel(vc:AddNewViewController)
    
}
