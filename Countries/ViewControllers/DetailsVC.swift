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
        updateUI()
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
    
    func updateUI() {
        backButton.setTitleColor(UIColor.white, for: .normal)
        backButton.tintColor             = UIColor.white
        countryNameLabel.numberOfLines   = 0
        cornerRadiusView.backgroundColor = UIColor.white
        cornerRadiusView.roundCorners(cornerRadius: 20)
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
        if indexPath.row != 3 {
            let cell = tableView.dequeueReusableCell(withIdentifier: "DetailsCell") as! DetailsCell
            
            let imagesArray  = ["i-star", "i-face", "i-earth"]
            let titleArray   = ["Country", "Population", "Continent"]
            let detailsArray = [country.capital ?? "", country.population ?? 0, country.continent ?? ""] as [Any]
            
            cell.imageView?.image      = UIImage(named: imagesArray[indexPath.row])
            cell.textLabel?.text       = titleArray[indexPath.row]
            cell.detailTextLabel?.text = "\(detailsArray[indexPath.row])"
            
            cell.configure()
            return cell
        } else {
            let cell = tableView.dequeueReusableCell(withIdentifier: "DescriptionCell") as! DescriptionCell
            cell.descriptinLabel.text = country.descriptin ?? ""
            
            cell.configure()
            return cell
        }
    }
    
}
