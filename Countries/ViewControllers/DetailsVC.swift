//
//  DetailsVC.swift
//  Countries
//
//  Created by Mac OSX on 5/17/18.
//  Copyright © 2018 Mac OSX. All rights reserved.
//

import UIKit
import ImageSlideshow

class CountryDetailsVC: UIViewController, UITableViewDataSource, UITableViewDelegate {

    @IBOutlet weak var backButton: UIButton!
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var bannerImagesView: ImageSlideshow!
    @IBOutlet weak var countryNameLabel: UILabel!
    @IBOutlet weak var cornerRadiusView: UIView!
    
    var country: Country!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureTableView()
        
    }
    
    func configureTableView() {
        tableView.delegate           = self
        tableView.dataSource         = self
        tableView.contentInset       = UIEdgeInsetsMake(60, 0, 0, 0)
        tableView.separatorStyle     = .singleLine
        tableView.backgroundColor    = UIColor.clear
        tableView.estimatedRowHeight = 44
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 4
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        return UITableViewCell()
    }
    
}
