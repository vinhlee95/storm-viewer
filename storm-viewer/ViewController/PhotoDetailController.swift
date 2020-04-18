//
//  PhotoDetailController.swift
//  storm-viewer
//
//  Created by Vinh Le on 4/17/20.
//  Copyright © 2020 Vinh Le. All rights reserved.
//

import UIKit

class PhotoDetailController: UIViewController {
    var imageName: String? {
        didSet {
            self.renderImage()
        }
    }
    
    let imageView: UIImageView = {
       let iv = UIImageView()
        iv.contentMode = .scaleAspectFill
        iv.clipsToBounds = true
        return iv
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.title = imageName
        navigationItem.largeTitleDisplayMode = .never
        
        view.addSubview(imageView)
        imageView.anchor(top: view.topAnchor, bottom: view.bottomAnchor, left: view.leftAnchor, right: view.rightAnchor, paddingTop: 0, paddingBottom: 0, paddingLeft: 0, paddingRight: 0, width: nil, height: nil)
    }
    
    func renderImage() {
        guard let imageName = self.imageName else {return}
        self.imageView.image = UIImage(named: imageName)
    }
}
