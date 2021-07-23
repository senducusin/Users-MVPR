//
//  UserDetailPresenter.swift
//  Users-MVPR
//
//  Created by Jansen Ducusin on 7/23/21.
//

import Foundation

protocol ModulePresenterWithCancel: AnyObject {
    func cancelDidTap()
}

protocol UserDetailPresenterProtocol: ModulePresenterWithCancel{
    var userDetailViewControl: UserDetailViewControlProtocol? {get set}
    var userDetailApi: UserDetailApiProtocol? {get set}
    var userDetailRouter: UserDetailRouterProtocol? {get set}
    var user: User? {get set}
    
    
    func toOtherModule()
}

class UserDetailPresenter: UserDetailPresenterProtocol {
    
    var userDetailRouter: UserDetailRouterProtocol?
    unowned var userDetailViewControl: UserDetailViewControlProtocol?
    weak var userDetailApi: UserDetailApiProtocol?
    
    var user: User?
    
    func cancelDidTap(){
        userDetailRouter?.returnToParentView()
    }
    
    func toOtherModule() {
        userDetailRouter?.pushToOtherModule()
    }
    
}
