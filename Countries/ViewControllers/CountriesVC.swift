//
//  CountriesVC.swift
//  Countries
//
//  Created by Mac OSX on 5/17/18.
//  Copyright © 2018 Mac OSX. All rights reserved.
//

import UIKit

class CountriesVC: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var errorMessageLabel: UILabel!
    
    var countries: [Country] = []

    override func viewDidLoad() {
        super.viewDidLoad()

        configureTableView()
    }
    
    func configureTableView() {
        tableView.delegate            = self
        tableView.dataSource          = self
        tableView.separatorStyle      = .singleLine
        tableView.backgroundColor     = UIColor.white
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.countries.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "CountryCell") as! CountryCell

        return cell
    }
}
