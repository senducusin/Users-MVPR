//
//  UserListTableViewController.swift
//  Users-MVPR
//
//  Created by Jansen Ducusin on 7/23/21.
//

import UIKit

protocol UserListTableViewControllerProtocol:AnyObject {
    var userListPresenterProtocol: UserListPresenterProtocol? {get set}
    
    func update(with users: [User])
    func update(with error: Error)
}

class UserListTableViewController: UITableViewController {
    // MARK: - Properties
    var userListPresenterProtocol: UserListPresenterProtocol?
    var users = [User]()
    
    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "User List"
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        view.backgroundColor = .white
    }
}

extension UserListTableViewController: UserListTableViewControllerProtocol{
    
    func update(with users: [User]) {
        DispatchQueue.main.async {
            self.users = users
            self.tableView.reloadData()
        }
    }
    
    func update(with error: Error) {
        
    }
    
}

extension UserListTableViewController {
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return users.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = users[indexPath.row].name
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        userListPresenterProtocol?.didSelectUser(user: users[indexPath.row])
        tableView.deselectRow(at: indexPath, animated: true)
    }
}
