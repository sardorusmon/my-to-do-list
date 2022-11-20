//
//  ChooseVC.swift
//  my to-do list
//
//  Created by Sardor Panjiyev on 19/11/22.
//

import UIKit

protocol GetColorAndTitleDelegate {
    func getColorAndTitle(info : PriorityDM)
}


class ChooseVC: UIViewController {


    var delegate : GetColorAndTitleDelegate?
        
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    

    @IBAction func choiceTapped(_ sender: UIButton) {
        
        delegate?.getColorAndTitle(info: PriorityDM(title: sender.currentTitle ?? "", color: sender.backgroundColor!))
        
        self.dismiss(animated: true)
        
        
        
    }
    
    
    
    
    

}
