//
//  UserDetailRouter.swift
//  Users-MVPR
//
//  Created by Jansen Ducusin on 7/23/21.
//

import UIKit

//typealias UserDetailEntryPoint = UserDetailPresenterProtocol & UserDetailApiProtocol

protocol UserDetailRouterProtocol: BaseRouterProtocol {
    func createModule(with user: User) ->  UIViewController
    
    func pushToOtherModule()
}

class UserDetailRouter: UserDetailRouterProtocol {
    var navigationController: UINavigationController
    
    init(parentView: UINavigationController){
        self.navigationController = parentView
    }
    
    func createModule(with user: User) -> UIViewController {
        let viewController = UserDetailViewController()
        
        let presenter = UserDetailPresenter()
        presenter.user = user

        viewController.userDetailPresenterProtocol = presenter
        viewController.userDetailPresenterProtocol?.userDetailRouter = self
        viewController.userDetailPresenterProtocol?.userDetailViewControl = viewController
        viewController.userDetailPresenterProtocol?.userDetailApi = UserDetailApi()
        viewController.userDetailPresenterProtocol?.userDetailApi?.userDetailPresenterProtocol = presenter
        
        return viewController
    }
    
    func returnToParentView() {
        navigationController.popToRootViewController(animated: true)
    }
    
    func pushToOtherModule() {
        
        let otherModuleRouter = OtherModuleRouter(navigationController: navigationController)
        
        let otherModuleViewController = otherModuleRouter.createModule()
        navigationController.pushViewController(otherModuleViewController, animated: true)
    }

}
