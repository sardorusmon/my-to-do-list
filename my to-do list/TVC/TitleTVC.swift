//
//  TitleTVC.swift
//  my to-do list
//
//  Created by Sardor Panjiyev on 20/11/22.
//

import UIKit

class TitleTVC: UITableViewCell {

    static func nib()-> UINib {
        return UINib(nibName: "TitleTVC", bundle: nil)
    }
    static var id = "TitleTVC"
    
    @IBOutlet weak var titleLbl: UILabel!
    
    
    
    override func awakeFromNib() {
        super.awakeFromNib()



    }

    func updateCell(info : TitleDM) {
        titleLbl.text = info.title
    }
    
    
    
}
