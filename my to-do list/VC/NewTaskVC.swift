//
//  NewTaskVC.swift
//  my to-do list
//
//  Created by Sardor Panjiyev on 19/11/22.
//

import UIKit

class NewTaskVC: UIViewController {
    
    @IBOutlet weak var addView: UIView!
    @IBOutlet weak var taskTitleTF: UITextField!
    @IBOutlet weak var descriptionTF: UITextField!
    @IBOutlet weak var PriorityBtn: UIButton!
    
    var sendInfo : ((CellDM?)->Void)?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        addView.layer.borderColor = UIColor.green.cgColor
        addView.layer.borderWidth = 1.0
        
    }
        
    @IBAction func goBack(_ sender: Any) {
        self.dismiss(animated: true)
    }
    
    @IBAction func addTapped(_ sender: Any) {
        guard let txt = taskTitleTF.text else {return}
        
        if !txt.isEmpty {
            
            sendInfo?(CellDM(title: taskTitleTF.text ?? "", caption: descriptionTF.text ?? "" , cycle: PriorityBtn.backgroundColor ))
            
            self.dismiss(animated: true)
                      
        } else {
            showAlert(title: "Task title can not be empty", message: "Please write the task in order to create a new task.")
        }
    }
    
    @IBAction func choiseTapped(_ sender: Any) {
        
        let vc = ChooseVC(nibName: "ChooseVC", bundle: nil)
        vc.delegate = self
        vc.modalPresentationStyle = .overFullScreen
        self.present(vc, animated: true)
    }
}

//MARK:-GetColorAndTitleDelegate
extension NewTaskVC : GetColorAndTitleDelegate{
    func getColorAndTitle(info: PriorityDM) {
        PriorityBtn.backgroundColor = info.color
        PriorityBtn.setTitle(info.title, for: .normal)
    }
}

//MARK:-showAlert
extension NewTaskVC {
    func showAlert(title : String , message : String ){
    
        let alertVC = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let okAction = UIAlertAction(title: "OK", style: .default)
        alertVC.addAction(okAction)
        self.present(alertVC, animated: true)
        
    }
}
