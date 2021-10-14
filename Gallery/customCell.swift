//
//  customCell.swift
//  Gallery
//
//  Created by Mac Mini on 12/10/21.
//

import UIKit

class customCell: UITableViewCell {

    @IBOutlet weak var btnFirst: UIButton!{
        didSet {
            btnFirst.layer.cornerRadius = 5
            btnFirst.layer.borderWidth = 0
            btnFirst.layer.borderColor = UIColor.systemBlue.cgColor
        }
    }
    @IBOutlet weak var btnSEcond: UIButton!{
        didSet {
            btnSEcond.layer.cornerRadius = 5
            btnSEcond.layer.borderWidth = 0
            btnSEcond.layer.borderColor = UIColor.systemBlue.cgColor
        }
    }
    @IBOutlet weak var viewFirst: UIView!
    @IBOutlet weak var viewSecond: UIView!
    @IBOutlet weak var imgFirst: UIImageView!
    @IBOutlet weak var imgSecond: UIImageView!
    
    @IBOutlet weak var lblViewFirstTitle: UILabel!
    
    @IBOutlet weak var lblViewFirstSize: UILabel!
    @IBOutlet weak var lblViewFirstDes: UILabel!


    @IBOutlet weak var lblViewSecondTitle: UILabel!
    
    @IBOutlet weak var lblViewSecondSize: UILabel!
    @IBOutlet weak var lblViewSecondDes: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

    }

}
