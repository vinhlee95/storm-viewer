//
//  ViewController.swift
//  storm-viewer
//
//  Created by Vinh Le on 4/16/20.
//  Copyright © 2020 Vinh Le. All rights reserved.
//

import UIKit

class ImageTableController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    private var pictures = [String]()
    private let cellId = "pictureCell"
    var tableView:UITableView!

    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.title = "Images"
        
        renderTableView()
        loadImages()
    }
    
    fileprivate func renderTableView() {
        tableView = UITableView(frame: view.bounds, style: .plain)
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(PictureCell.self, forCellReuseIdentifier: cellId)
        view.addSubview(tableView)
    }

    fileprivate func loadImages() {
        let fm = FileManager.default
        let path = Bundle.main.resourcePath! // all resources will be bundled here, including our images
        let items = try! fm.contentsOfDirectory(atPath: path)
        for item in items {
            if item.hasPrefix("nssl") {
                self.pictures.append(item)
            }
        }
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return pictures.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellId, for: indexPath) as! PictureCell
        cell.textLabel?.text = pictures[indexPath.item]
        cell.accessoryType = .disclosureIndicator
        cell.tintColor = UIColor.blue
        return cell
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let photoDetailController = PhotoDetailController()
        photoDetailController.imageName = pictures[indexPath.item]
        navigationController?.pushViewController(photoDetailController, animated: true)
    }
}

