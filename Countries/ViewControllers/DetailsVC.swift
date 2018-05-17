//
//  DetailsVC.swift
//  Countries
//
//  Created by Mac OSX on 5/17/18.
//  Copyright © 2018 Mac OSX. All rights reserved.
//

import UIKit
import ImageSlideshow

class DetailsVC: UIViewController, UITableViewDataSource, UITableViewDelegate {

    @IBOutlet weak var backButton: UIButton!
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var bannerImagesView: ImageSlideshow!
    @IBOutlet weak var countryNameLabel: UILabel!
    @IBOutlet weak var cornerRadiusView: UIView!
    
    @IBAction func backButtonPressed(_ sender: Any) {
        navigationController?.popViewController(animated: true)
    }
    
    var country: Country!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureImageSlideShow()
        configureTableView()
        fillUpWithData()
        
    }
    
    func configureTableView() {
        tableView.delegate           = self
        tableView.dataSource         = self
        tableView.contentInset       = UIEdgeInsetsMake(60, 0, 0, 0)
        tableView.separatorStyle     = .singleLine
        tableView.backgroundColor    = UIColor.clear
        tableView.estimatedRowHeight = 44
    }
    
    func fillUpWithData() {
        countryNameLabel.text = country.name ?? ""
        backButton.setTitle("  Countries", for: .normal)
        backButton.setImage(UIImage(named: "back"), for: .normal)
    }
    
    func configureImageSlideShow() {
        bannerImagesView.backgroundColor   = UIColor.clear
        bannerImagesView.contentScaleMode  = .scaleAspectFill
        bannerImagesView.clipsToBounds     = true
        bannerImagesView.slideshowInterval = 5
        bannerImagesView.activityIndicator = DefaultActivityIndicator()
        
        var inputSource = [InputSource]()
        if (country.country_info?.images?.count)! == 0 {
            inputSource.append(KingfisherSource(urlString: country.country_info?.flag ?? "")!)
        } else {
            for image in (country.country_info?.images)! {
                inputSource.append(KingfisherSource(urlString: image)!)
            }
        }
        bannerImagesView.setImageInputs(inputSource)
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
