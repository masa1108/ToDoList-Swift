//
//  SubTableViewCell.swift
//  todo list sample
//
//  Created by 中村将大 on 2014/09/01.
//  Copyright (c) 2014年 masa. All rights reserved.
//

import UIKit

class SubTableViewCell: UITableViewCell {
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var titleTextField: UITextField!
    
  
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    class func rowHeight () -> CGFloat {
        return 44.0
    }

}
