//
//  MainVC.swift
//  my to-do list
//
//  Created by Sardor Panjiyev on 19/11/22.
//

import UIKit

class MainVC: UIViewController {
    
    
    @IBOutlet weak var tableView: UITableView!
    
    var cellArr : [CellDM] = []
    
    var titleArr : [String] = ["first","second","third",]
    

    override func viewDidLoad() {
        super.viewDidLoad()


        upDateTableView()

    }
    
    func upDateTableView() {
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(ItemsTVC.nib(), forCellReuseIdentifier: ItemsTVC.id)
        tableView.separatorStyle = .none
        tableView.register(TitleTVC.nib(), forCellReuseIdentifier: TitleTVC.id)
        
        
        
    }
    
    
    
    
    
    @IBAction func addTapped(_ sender: Any) {
        let vc = NewTaskVC(nibName: "NewTaskVC", bundle: nil)
        vc.sendInfo = { [self] data in
            guard let dat = data else {return}
            cellArr.append(dat)
            tableView.reloadData()
        }
        
        vc.modalPresentationStyle = .overFullScreen
        self.present(vc, animated: true)
        
    }
    



    
    
    
}

extension MainVC : UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        showAlert(title: "Choose what to do", message: "", index: indexPath)
        
    }
    
    func tableView(_ tableView: UITableView, leadingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {

        let deleteAction = UIContextualAction(style: .destructive, title: "Delete"){_,_,_ in  self.cellArr.remove(at: indexPath.row)
            tableView.reloadData() }
        
        let configuration = UISwipeActionsConfiguration(actions: [deleteAction])
        return configuration
        
    }
    

    
    
    
}





extension MainVC : UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        cellArr.count
    }
    

        
        
    
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell1 = tableView.dequeueReusableCell(withIdentifier: ItemsTVC.id, for: indexPath) as? ItemsTVC else {return UITableViewCell()}
        cell1.updateCell(info: cellArr[indexPath.row])
        return cell1
        
//        guard let cellTitle = tableView.dequeueReusableCell(withIdentifier: TitleTVC.id, for: indexPath) as? TitleTVC else {return UITableViewCell()}
//        return cellTitle , cell1
        
    }
}
 

//MARK:-showAlert
extension MainVC {
    
    func showAlert(title : String , message : String, index : IndexPath ){
        
        let alertVC = UIAlertController(title: title, message: message, preferredStyle: .actionSheet)
        
        let FinishAction = UIAlertAction(title: "Finish 🎉", style: .default){_ in
            
        }
        let ArchiveAction = UIAlertAction(title: "Archive", style: .default){_ in
            
        }
        let DeleteAction = UIAlertAction(title: "Delete", style: .destructive){[self]_ in
                cellArr.remove(at: index.row)
                tableView.reloadData()
        }
        
        let CancelAction = UIAlertAction(title: "Cancel", style: .cancel){_ in
            
        }
        
        
        alertVC.addAction(FinishAction)
        alertVC.addAction(ArchiveAction)
        alertVC.addAction(DeleteAction)
        alertVC.addAction(CancelAction)
                
        
        self.present(alertVC, animated: true)
        
    }
}
