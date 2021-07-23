//
//  UserListPresenter.swift
//  Users-MVPR
//
//  Created by Jansen Ducusin on 7/23/21.
//

import Foundation

protocol UserListPresenterProtocol:AnyObject {
    var userListRouter: UserListRouterProtocol? {get set}
    var userListApi: UserListApiProtocol? {get set}
    var userListTableViewController: UserListTableViewControllerProtocol? {get set}
    func didFetchUsers(with result: Result<[User], Error>)
    func didSelectUser(user: User)
}

class UserListPresenter: UserListPresenterProtocol {

    
    // MARK: - Properties
    
     var userListRouter: UserListRouterProtocol?
    
    weak var userListTableViewController: UserListTableViewControllerProtocol?
    
    var userListApi: UserListApiProtocol? {
        didSet {
            userListApi?.getUsers()
        }
    }
    
    // MARK: - Methods
    func didFetchUsers(with result: Result<[User], Error>) {
        switch result {
        
        case .success(let users):
            userListTableViewController?.update(with: users)
        case .failure(let error):
            userListTableViewController?.update(with: error)
        }
    }
    
    func didSelectUser(user: User) {
        
        guard let userListTableViewController = self.userListTableViewController else {return}
        
        guard let userListRouter = self.userListRouter else {return}
        
        userListRouter.pushToUserDetail(on: userListTableViewController, with: user)
    }
    
}
