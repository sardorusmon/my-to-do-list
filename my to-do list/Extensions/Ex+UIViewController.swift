//
//  Extensions.swift
//  my to-do list
//
//  Created by Sardor Panjiyev on 27/11/22.
//

import Foundation
import UIKit

extension UIViewController {
    
    func showAlert(groupType : GroupTypeEnum? , title : String , message : String? , type : UIAlertController.Style, completion : @escaping ((GroupTypeEnum?)->Void)) {
        
        
        let alertVC = UIAlertController(title: title, message: message, preferredStyle: type)
        guard let groupType = groupType else {
            
            let okAction = UIAlertAction(title: "OK", style: .default) { _ in
                completion(nil) }
            
            
            alertVC.addAction(okAction)
            self.present(alertVC, animated: true , completion: nil)
            return
        }
        
        let finishAction = UIAlertAction(title: "Finesh", style: .default) { _ in
            completion(.fineshed) }
        
        let UnfinishAction = UIAlertAction(title: "UnFinesh", style: .default) { _ in
            completion(.unfinesh) }
        
        let archiveAction = UIAlertAction(title: "Archive", style: .default) { _ in
            completion(.archived) }
        
        let UnarchiveAction = UIAlertAction(title: "UnArchive", style: .default) { _ in
            completion(.unArchive) }

        let deleteAction = UIAlertAction(title: "Delete", style: .default) { _ in
            completion(.deleted) }

        let cancelAction = UIAlertAction(title: "Cancel", style: .cancel) { _ in
            completion(nil) }
        

        switch groupType {
            
        case .new:
            alertVC.addAction(finishAction)
            alertVC.addAction(archiveAction)
        case .archived:
            alertVC.addAction(UnarchiveAction)
        case .fineshed:
            alertVC.addAction(UnfinishAction)
            alertVC.addAction(archiveAction)
        case .unfinesh:
            print("unfinesh")
        case .unArchive:
            print("unArchive")
        case .deleted:
            print("deleted")
            }
        
        alertVC.addAction(cancelAction)
        alertVC.addAction(deleteAction)
        self.present(alertVC, animated: true)
    }
    
    
    
}
