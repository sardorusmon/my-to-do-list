//
//  ChooseVC.swift
//  my to-do list
//
//  Created by Sardor Panjiyev on 19/11/22.
//

import UIKit



class ChooseVC: UIViewController {

        
    var choosenPriority : ((PriorityEnum)->Void)?
    var titleBtn : ((String)->Void)?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    

    @IBAction func choiceTapped(_ sender: UIButton) {
        
        
        switch sender.tag {
            
        case 0 : choosenPriority?(.high)
        case 1 : choosenPriority?(.medium)
        case 2 : choosenPriority?(.low)
        case 3 : choosenPriority?(.none)
        default : choosenPriority?(.none)
        }
        
        titleBtn?(sender.currentTitle!)
        self.dismiss(animated: true)
        
    }
   
    
    
    
    
    

}
