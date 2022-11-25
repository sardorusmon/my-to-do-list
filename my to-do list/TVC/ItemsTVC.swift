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
    @IBOutlet weak var subTitleLbl: UILabel!
    @IBOutlet weak var priorityView: UIView!
    @IBOutlet weak var typeView: UIView!
    
    override func awakeFromNib() {
        super.awakeFromNib()


    }

    
    
    func updateCell( task : TaskDM , groupType : GroupTypeEnum ) {
        
        titleLbl.text = task.title
        subTitleLbl.text = task.subtitle
        
        switch task.priority {
        case .high:
            priorityView.backgroundColor = .systemRed
        case .medium:
            priorityView.backgroundColor = .systemOrange
        case .low:
            priorityView.backgroundColor = .systemGreen
        case .none:
            priorityView.backgroundColor = .systemGray

        }
    
        switch groupType {
        case .new :
            typeView.backgroundColor = .systemGray6
        case .archived:
            typeView.backgroundColor = .systemGray4
        case .fineshed:
            typeView.backgroundColor = .systemGray2
        }
        
    }
  
    
    
    
    
}
