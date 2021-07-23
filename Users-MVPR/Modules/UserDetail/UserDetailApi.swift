//
//  UserDetailApi.swift
//  Users-MVPR
//
//  Created by Jansen Ducusin on 7/23/21.
//

import Foundation

protocol UserDetailApiProtocol: AnyObject {
    var userDetailPresenterProtocol: UserDetailPresenterProtocol? {get set}
}


class UserDetailApi: UserDetailApiProtocol {
    var userDetailPresenterProtocol: UserDetailPresenterProtocol?
    
    
}
