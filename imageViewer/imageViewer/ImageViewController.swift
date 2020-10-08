//
//  ImageViewController.swift
//  imageViewer
//
//  Created by SM Arif Ahmed on 5/10/20.
//  Copyright © 2020 SM Arif Ahmed. All rights reserved.
//

import UIKit

class ImageViewController: UIViewController {

    @IBOutlet weak var imageShow: UIImageView!
    var viewingImage: UIImage!
    var imageNumber: Int!
    
    var object: ViewController!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        imageShow.image = viewingImage
        // Do any additional setup after loading the view.
    }
    

   

}
