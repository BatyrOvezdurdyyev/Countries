//
//  CountriesVC.swift
//  Countries
//
//  Created by Mac OSX on 5/17/18.
//  Copyright © 2018 Mac OSX. All rights reserved.
//

import UIKit
import Alamofire
import ObjectMapper
import Kingfisher

class CountriesVC: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var errorMessageLabel: UILabel!
    
    var countries: [Country] = []
    var nextPageUrl: String  = ""
    var key                  = "cachedKey"

    override func viewDidLoad() {
        super.viewDidLoad()

        configureTableView()
        updateUI()
        fillUpWithData()
    }
    
    func configureTableView() {
        tableView.delegate            = self
        tableView.dataSource          = self
        tableView.separatorStyle      = .singleLine
        tableView.backgroundColor     = UIColor.white
        tableView.estimatedRowHeight  = 44.0
    }
    
    func fillUpWithData() {
        title = "Countries"
    }
    
    func updateUI() {
        
        errorMessageLabel.numberOfLines = 0
        errorMessageLabel.font          = UIFont.systemFont(ofSize: 14)
        errorMessageLabel.textColor     = UIColor.darkGray
    }
    
    func getCountriesFromCacheOrUrl() {
        if userDefaults.object(forKey: key) != nil {
            getAllCountriesFromCache()
        } else {
            let urlString = "https://rawgit.com/NikitaAsabin/799e4502c9fc3e0ea7af439b2dfd88fa/raw/7f5c6c66358501f72fada21e04d75f64474a7888/page1.json"
            getAllCountriesFromServer(urlString: urlString)
        }
    }
    
    func getAllCountriesFromCache() {
        
        guard let data      = userDefaults.object(forKey: key) as? NSData else{ return }
        guard let countries = NSKeyedUnarchiver.unarchiveObject(with: data as Data) as? [Country] else { return}
        self.countries      = countries
        
        self.tableView.reloadData()
    }
    
    func getAllCountriesFromServer(urlString: String) {
        Alamofire.request(urlString).responseJSON { (response) in
            if let data = response.result.value as? Dictionary<String, AnyObject> {
                
                self.errorMessageLabel.isHidden = true
                self.tableView.isHidden         = false
                
                let countriesResponse = CountriesResponse(JSON: data)
                guard let countries   = countriesResponse?.countries else {return}
                guard let next        = countriesResponse?.next else {return}
                
                if countries.count > 0 {
                    self.countries   = self.countries + countries
                    let datalar      = NSKeyedArchiver.archivedData(withRootObject: self.countries)
                    userDefaults.set(datalar, forKey: self.key) //ex: jsonPage_0
                    self.nextPageUrl = next
                    self.tableView.reloadData()
                }
            } else {
                print("error in getting data in CountriesVC")
                if (userDefaults.object(forKey: self.key) == nil) {
                    self.tableView.isHidden         = true
                    self.errorMessageLabel.isHidden = false
                    self.errorMessageLabel.text     = "Can not connect to Internet"
                }
            }
        }
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.countries.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "CountryCell") as! CountryCell
        let country                     = self.countries[indexPath.row]
        cell.nameLabel.text             = country.name ?? ""
        cell.capitalCityLabel.text      = country.capital ?? ""
        cell.logoImageView.kf.setImage(with: URL(string: country.country_info?.flag ?? ""))
        cell.shortDescriptionLabel.text = country.description_small ?? ""
        
        cell.configure()
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableViewAutomaticDimension
    }
}
