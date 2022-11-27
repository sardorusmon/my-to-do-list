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
        
        setUpTableView()
        
    }
    
    @IBAction func addTapped(_ sender: Any) {
        let vc = NewTaskVC(nibName: "NewTaskVC", bundle: nil)
        vc.addNewTask = { [self] data in
            
            groupTasks[0].tasks.append(data)
            tableView.reloadData()
            
        }
        vc.modalPresentationStyle = .overFullScreen
        self.present(vc, animated: false)
    }
    
    
}
//MARK:-setUpTableView
extension MainVC {
        func setUpTableView() {
            tableView.delegate = self
            tableView.dataSource = self
            tableView.register(ItemsTVC.nib(), forCellReuseIdentifier: ItemsTVC.id)
            tableView.separatorStyle = .none
        }
        
        
    }
    
//MARK:-UITableViewDelegate
extension MainVC : UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let group = groupTasks[indexPath.section]
        
        showAlert(groupType: group.groupType, title: "Choose What to do", message: nil, type: .actionSheet) { groupType in
            
            guard let groupType = groupType else {return}
            
            switch groupType {
                
            case .new:
                print("new")
            case .archived:
                let archivedTask = self.groupTasks[indexPath.section].tasks.remove(at: indexPath.row)
                self.groupTasks[1].tasks.append(archivedTask)
            case .fineshed:
                let finishedTask = self.groupTasks[indexPath.section].tasks.remove(at: indexPath.row)
                self.groupTasks[2].tasks.append(finishedTask)
            case .unfinesh:
                let unfineshTask = self.groupTasks[indexPath.section].tasks.remove(at: indexPath.row)
                self.groupTasks[0].tasks.append(unfineshTask)
            case .unArchive:
                let unArchiveTask = self.groupTasks[indexPath.section].tasks.remove(at: indexPath.row)
                self.groupTasks[0].tasks.append(unArchiveTask)
            case .deleted:
                self.groupTasks[indexPath.section].tasks.remove(at: indexPath.row)
            }
            
            self.tableView.reloadData()
            
        }
        tableView.reloadData()

    }
    
    
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let v = UIView(frame: CGRect (x: 0, y: 0, width: self.view.frame.width, height: 30))
        v.backgroundColor = .white
        let title = groupTasks[section].groupType.rawValue.capitalized+"Tasks"
        
        let lbl = UILabel(frame: CGRect(x: 0, y: 0, width: title.widthOfString(usingFont:.boldSystemFont (ofSize: 17)) + 20, height: 30))
        lbl.text = title
        lbl.layer.cornerRadius = 15
        lbl.clipsToBounds = true
        lbl.textColor = #colorLiteral(red: 0.4666666687, green: 0.7647058964, blue: 0.2666666806, alpha: 1)
        lbl.font = .boldSystemFont(ofSize: 17)
        lbl.textAlignment = .center
        lbl.backgroundColor = .systemGray6
        v.addSubview(lbl)
        lbl.center = v.center
                
        return v
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        let group = groupTasks[section]
        
        if group.tasks.isEmpty {
            return 0
        }
    
        return 30
    }

    
    
func tableView(_ tableView: UITableView, leadingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        let deleteAction = UIContextualAction(style: .destructive, title: "Delete" ) { _,_,_ in
            self.groupTasks[indexPath.section].tasks.remove(at: indexPath.row)
            tableView.reloadData()
        }
        
        let configuration = UISwipeActionsConfiguration(actions: [deleteAction])
        return configuration
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

