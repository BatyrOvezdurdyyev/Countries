//
//  CountryCell.swift
//  Countries
//
//  Created by Mac OSX on 5/17/18.
//  Copyright © 2018 Mac OSX. All rights reserved.
//

import UIKit

class CountryCell: UITableViewCell {
    
    @IBOutlet weak var logoImageView: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var capitalCityLabel: UILabel!
    @IBOutlet weak var shortDescriptionLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        self.selectionStyle  = .blue
    }
    
    func configure() {
        
        shortDescriptionLabel.numberOfLines  = 0
        
        logoImageView.contentMode            = .scaleAspectFit
        logoImageView.clipsToBounds          = true
        logoImageView.backgroundColor        = UIColor.white
        
    }
}
