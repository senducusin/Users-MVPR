//
//  OtherModuleRouter.swift
//  Users-MVPR
//
//  Created by Jansen Ducusin on 7/23/21.
//

import UIKit

protocol OtherModuleRouterProtocol:BaseRouterProtocol{
    func createModule() -> UIViewController
}

class OtherModuleRouter: OtherModuleRouterProtocol{
    
    var navigationController: UINavigationController
    
    init(navigationController: UINavigationController){
        self.navigationController = navigationController
    }
    
    func createModule() -> UIViewController {
        
        let viewController = OtherModuleViewController()
        
        let presenter = OtherModulePresenter()
        
        viewController.otherModulePresenterProtocol = presenter
        viewController.otherModulePresenterProtocol?.otherModuleRouter = self
        viewController.otherModulePresenterProtocol?.otherModuleViewController = viewController
        viewController.otherModulePresenterProtocol?.otherModuleApi = OtherModuleApi()
        viewController.otherModulePresenterProtocol?.otherModuleApi?.otherModulePresenterProtocol = presenter
        
        return viewController
        
    }
    
    func returnToParentView() {
        navigationController.popToRootViewController(animated: true)
    }
    
    
}
