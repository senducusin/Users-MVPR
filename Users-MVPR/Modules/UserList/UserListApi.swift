//
//  UserListApi.swift
//  Users-MVPR
//
//  Created by Jansen Ducusin on 7/23/21.
//

import Foundation

protocol UserListApiProtocol:AnyObject {
    var userListPresenterProtocol: UserListPresenterProtocol? {get set}
    
    func getUsers()
}

class UserListApi {
    
    var userListPresenterProtocol: UserListPresenterProtocol?
}

extension UserListApi: UserListApiProtocol{
    
    func getUsers() {
        guard let url = URL(string: "https://jsonplaceholder.typicode.com/users") else {return}
        
        let task = URLSession.shared.dataTask(with: url) { [weak self] data, _, error in
            guard let data = data, error == nil else {
                if let error = error {
                    self?.userListPresenterProtocol?.didFetchUsers(with: .failure(error))
                }
                return
            }
            
            do {
                
                let users = try JSONDecoder().decode([User].self, from: data)
                self?.userListPresenterProtocol?.didFetchUsers(with: .success(users))
                
            }catch{
                self?.userListPresenterProtocol?.didFetchUsers(with: .failure(error))
            }
        }
        
        task.resume()
    }
    
    
}
