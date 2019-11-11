//
//  GenericTableViewController.swift
//  SwiftCheatSheet
//
//  Created by Erez Mizrahi on 11/11/2019.
//  Copyright © 2019 Erez Mizrahi. All rights reserved.
//

import UIKit

class GenericTableViewController<T: BaseCell<U>, U>: UITableViewController {

    let reuseIdentifier = "reuseIdentifier"
    
    var items = [U]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //register the cell
        tableView.register(T.self, forCellReuseIdentifier: reuseIdentifier)
    }

    // MARK: - Table view data source
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return items.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: reuseIdentifier, for: indexPath) as! BaseCell<U>
        
        let dataSourceItem = items[indexPath.row]
        cell.item = dataSourceItem

        return cell
    }
//   MARK:- Selecting row
//    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
//        tableView.deselectRow(at: indexPath, animated: true)
//        let cell = tableView.cellForRow(at: indexPath)
//        cell?.backgroundColor = .yellow
//    }
    
    
//    MARK:- Swipe Actions
    //trailing
//    override func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
//        let someaction = someAction(at: indexPath)
//        let delete = deleteAction(at: indexPath)
//        return UISwipeActionsConfiguration(actions: [delete, someaction])
//    }
//
//    //leading
//    override func tableView(_ tableView: UITableView, leadingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
//        let someaction = someAction(at: indexPath)
//        let delete = deleteAction(at: indexPath)
//        return UISwipeActionsConfiguration(actions: [delete, someaction])
//    }
//
//    private func someAction(at indexPath: IndexPath)-> UIContextualAction{
//        let dataSourceItem = items[indexPath.row]
//
//        let action = UIContextualAction(style: .normal, title: "someAction") { (action, view, completion) in
//            // TODO: action implemention
//            completion(true)
//        }
//        action.image = .strokedCheckmark
//        action.backgroundColor = .purple
//        return action
//
//    }
//
//    private func deleteAction(at indexPath: IndexPath)-> UIContextualAction{
//        let action = UIContextualAction(style: .destructive, title: "Delete") {[weak self] (action, view, completion) in
//            guard let strongSelf = self else { return }
//
//            strongSelf.items.remove(at: indexPath.row)
//            strongSelf.tableView.deleteRows(at: [indexPath], with: .automatic)
//            completion(true)
//
//            }
//
//        action.image = .remove
//        action.backgroundColor = .red
//        return action
//    }

}

class BaseCell<U>: UITableViewCell {
    var item: U!
}








