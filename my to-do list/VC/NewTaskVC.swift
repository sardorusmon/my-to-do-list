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
    @IBOutlet weak var discriptionTV: UITextView!
    @IBOutlet weak var PriorityBtn: UIButton!
    
    
    var newTAsk : TaskDM = TaskDM(title: "", subtitle: "", priority: .none)
    var addNewTask : ((TaskDM)->Void)?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
      setUpView()
        
        
    }
    
        
    override func viewWillAppear(_ animated: Bool) {
        UIView.animate(withDuration: 0.1, delay: 0, options: .curveEaseIn){
            
            self.addView.transform = .identity
            self.view.backgroundColor = .gray.withAlphaComponent(0.2)
            
        }
        
    }
    
    @IBAction func goBack(_ sender: Any) { dismissVC() }
    
    @IBAction func addTapped(_ sender: Any) {
        
        
        newTAsk.title = taskTitleTF.text!
        newTAsk.subtitle = discriptionTV.text!
        guard let txt = taskTitleTF.text else {return}
        if !txt.isEmpty {
            guard let addNewTask = addNewTask else {return}
            addNewTask(newTAsk)
            dismissVC()
        } else {
            
            showAlert(groupType: nil, title: "Task title can not be empty", message: "Please write the task in order to create a new task.", type: .alert){_ in}
            
                }
    }
    
    @IBAction func choiseTapped(_ sender: Any) {
        
        let vc = ChooseVC(nibName: "ChooseVC", bundle: nil)
        vc.choosenPriority = { pri in
            self.newTAsk.priority = pri
            self.PriorityBtn.backgroundColor = pri == .none ? .systemGray : pri.setPrioriyColor()
        }
        
        vc.titleBtn = {title in
            self.PriorityBtn.setTitle(title.capitalized, for: .normal)
            
        }
        vc.modalPresentationStyle = .overFullScreen
        self.present(vc, animated: false)
    }
}
//MARK: -setUpView
extension NewTaskVC {
    func setUpView() {
        addView.layer.borderColor = UIColor.green.cgColor
        addView.layer.borderWidth = 1.0
        addView.transform = .init(translationX: 0, y: 1000)
        self.view.backgroundColor = .clear
        discriptionTV.layer.borderColor = UIColor.systemGray4.cgColor
        discriptionTV.layer.borderWidth = 1
        discriptionTV.cornerRadius = 5
    }

}

//MARK: -dismissVC
extension NewTaskVC {
    func dismissVC() {
        UIView.animate(withDuration: 0.1, delay: 0, options: .curveEaseIn){
            self.addView.transform = .init(translationX: 0, y: 1000)
            self.view.backgroundColor = .clear } completion: { _ in
                self.dismiss(animated: false)

            }
        
    }
}



