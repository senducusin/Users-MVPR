//
//  OtherModuleApi.swift
//  Users-MVPR
//
//  Created by Jansen Ducusin on 7/23/21.
//

import Foundation

protocol OtherModuleApiProtocol: AnyObject{
    var otherModulePresenterProtocol: OtherModulePresenterProtocol? {get set}
}

class OtherModuleApi: OtherModuleApiProtocol {
    var otherModulePresenterProtocol: OtherModulePresenterProtocol?
    
    
}
