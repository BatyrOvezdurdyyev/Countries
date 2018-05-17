//
//  DetailsCell.swift
//  Countries
//
//  Created by Mac OSX on 5/17/18.
//  Copyright © 2018 Mac OSX. All rights reserved.
//

import UIKit

class DetailsCell: UITableViewCell {
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        self.selectionStyle  = .none
    }
    
    func configure() {
        textLabel?.font = UIFont.systemFont(ofSize: 17)
        detailTextLabel?.font = UIFont.systemFont(ofSize: 17)
        detailTextLabel?.textColor = UIColor.darkGray
    }
}
