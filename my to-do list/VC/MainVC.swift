//
//  MainVC.swift
//  my to-do list
//
//  Created by Sardor Panjiyev on 19/11/22.
//

import UIKit

class MainVC: UIViewController {
    
    
    @IBOutlet weak var tableView: UITableView!
    var groupTasks : [TaskGroupDM] = [
        TaskGroupDM(tasks: [], groupType: .new),
        TaskGroupDM(tasks: [], groupType: .archived),
        TaskGroupDM(tasks: [], groupType: .fineshed),
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        upDateTableView()
        
    }
    
    @IBAction func addTapped(_ sender: Any) {
        let vc = NewTaskVC(nibName: "NewTaskVC", bundle: nil)
        //        vc.sendInfo = { [self] data in
        //            guard let dat = data else {return}
        //            tableView.reloadData()
    vc.modalPresentationStyle = .overFullScreen
    self.present(vc, animated: false)
    }
}
    


//MARK:-upDateTableView
extension MainVC {
    func upDateTableView() {
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(ItemsTVC.nib(), forCellReuseIdentifier: ItemsTVC.id)
//        tableView.register(TitleTVC.nib(), forCellReuseIdentifier: TitleTVC.id)
        tableView.separatorStyle = .none
    }
    

}

//MARK:-UITableViewDelegate
extension MainVC : UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
//
    }

    
}

//MARK:-UITableViewDataSource
extension MainVC : UITableViewDataSource {
    
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return groupTasks.count
    }
    
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return groupTasks[section].tasks.count
    }
    
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
            guard let cell = tableView.dequeueReusableCell(withIdentifier: ItemsTVC.id, for: indexPath) as? ItemsTVC else {return UITableViewCell()}
    
        cell.updateCell(task: groupTasks[indexPath.section].tasks[indexPath.row], groupType: groupTasks[indexPath.section].groupType)
            return cell
            
        
    }
}
 
