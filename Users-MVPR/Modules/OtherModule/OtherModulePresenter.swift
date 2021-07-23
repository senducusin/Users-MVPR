//
//  OtherModulePresenter.swift
//  Users-MVPR
//
//  Created by Jansen Ducusin on 7/23/21.
//

import Foundation

protocol OtherModulePresenterProtocol: ModulePresenterWithCancel {
    var otherModuleViewController: OtherModuleViewControllerProtocol? {get set}
    var otherModuleApi: OtherModuleApiProtocol? {get set}
    var otherModuleRouter: OtherModuleRouterProtocol? {get set}
}

class OtherModulePresenter: OtherModulePresenterProtocol{

    weak var otherModuleApi: OtherModuleApiProtocol?
    
    var otherModuleRouter: OtherModuleRouterProtocol?
    
    unowned var otherModuleViewController: OtherModuleViewControllerProtocol?
    
    func cancelDidTap() {
        otherModuleRouter?.returnToParentView()
    }
    
}
