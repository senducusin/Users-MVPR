//
//  UserListRouter.swift
//  Users-MVPR
//
//  Created by Jansen Ducusin on 7/23/21.
//

import UIKit

protocol BaseRouterProtocol: AnyObject {
    var navigationController: UINavigationController { get set }
    func returnToParentView()
}

protocol UserListRouterProtocol:BaseRouterProtocol {
    func pushToUserDetail(on view: UserListTableViewControllerProtocol, with user: User)
}

class UserListRouter: UserListRouterProtocol {
    
    var navigationController: UINavigationController
    
    init(userListTableViewController: UserListTableViewController){
        
        navigationController = UINavigationController(rootViewController: userListTableViewController)
        
        let presenter = UserListPresenter()
    
        userListTableViewController.userListPresenterProtocol = presenter
        userListTableViewController.userListPresenterProtocol?.userListRouter = self
        userListTableViewController.userListPresenterProtocol?.userListTableViewController = userListTableViewController
        userListTableViewController.userListPresenterProtocol?.userListApi = UserListApi()
        userListTableViewController.userListPresenterProtocol?.userListApi?.userListPresenterProtocol = presenter
    }
    
    func pushToUserDetail(on view: UserListTableViewControllerProtocol, with user: User){
        
        guard let userListRouter = view.userListPresenterProtocol?.userListRouter else{
            return
        }
        
        let router = UserDetailRouter(parentView: userListRouter.navigationController)
        
        let userDetailViewController = router.createModule(with: user)
        router.navigationController.pushViewController(userDetailViewController, animated: true)
    }
    
    func returnToParentView() {
        navigationController.popToRootViewController(animated: true)
    }
}

 
