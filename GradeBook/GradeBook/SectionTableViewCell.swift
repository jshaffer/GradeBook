//
//  SectionTableViewCell.swift
//  GradeBook
//
//  Created by Classroom Tech User on 3/4/15.
//  Copyright (c) 2015 Classroom Tech User. All rights reserved.
//

import UIKit

class SectionTableViewCell: UITableViewCell {
    
    var term : String = ""
    var course : String = ""

    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
