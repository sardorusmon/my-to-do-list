//
//  ItemsTVC.swift
//  my to-do list
//
//  Created by Sardor Panjiyev on 19/11/22.
//

import UIKit

class ItemsTVC: UITableViewCell {

    
    static func nib() -> UINib{
        return UINib(nibName: "ItemsTVC", bundle: nil)
    }
    
    static var id = "ItemsTVC"
    

    @IBOutlet weak var titleLbl: UILabel!
    @IBOutlet weak var captionLbl: UILabel!
    @IBOutlet weak var cycleView: UIView!
    @IBOutlet weak var cellView: UIView!
    
    
    
    
    
    
    
    
    override func awakeFromNib() {
        super.awakeFromNib()


    }

    
    
    func updateCell( info : CellDM) {
        titleLbl.text = info.title
        captionLbl.text = info.caption
        cycleView.backgroundColor = info.cycle
        cellView.backgroundColor = info.cellColor
    }
  
    
    
    
    
}
