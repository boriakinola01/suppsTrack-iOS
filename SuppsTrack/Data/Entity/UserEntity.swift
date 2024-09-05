//
//  UserEntity.swift
//  SuppsTrack
//
//  Created by Bori Akinola on 22/08/2024.
//

import Foundation

struct UserEntity: Codable {
    enum Keys: String, CaseIterable {
        case id
        case firstName
        case lastName
        case age
        case email
    }
    
    

    var id: String

    var firstName: String

    var lastName: String

    var age: Int

    var email: String?

    init() {
        self.id = ""
        self.age = 0
        self.firstName = ""
        self.lastName = ""
        self.email = ""
    }

    init(id: String, firstName: String, lastName: String, age: Int, email: String? = nil) {
        self.id = id
        self.firstName = firstName
        self.lastName = lastName
        self.age = age
        self.email = email
    }

    func toDictionary() -> [String: Any]? {
        guard let email else {
            return nil
        }

        var dict = [String: Any]()

        dict[Keys.id.rawValue] = id
        dict[Keys.firstName.rawValue] = firstName
        dict[Keys.lastName.rawValue] = lastName
        dict[Keys.age.rawValue] = age
        dict[Keys.email.rawValue] = email

        return dict
    }
}
