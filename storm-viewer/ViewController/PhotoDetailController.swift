//
//  PhotoDetailController.swift
//  storm-viewer
//
//  Created by Vinh Le on 4/17/20.
//  Copyright © 2020 Vinh Le. All rights reserved.
//

import UIKit

class PhotoDetailController: UIViewController {
    var imageName: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .red
        navigationItem.title = imageName
    }
}
