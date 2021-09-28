//
//  MockBaseService.swift
//  KC-ChallengeTests
//
//  Created by Brayam Alberto Mora Arias on 28/09/21.
//

import Foundation
@testable import KC_Challenge

extension BaseService {
    func sendRequestMock<T: Decodable>(url: String, of type: T.Type, method: HTTPMethod, completion: @escaping (Result<T, CustomError>) -> Void) {
        if type is [Contact].Type {
            let response = generateContactsResponse()
            completion(.success(response as! T))
        }
        
    }
    
    private func generateContactsResponse() -> [Contact]? {
        let bundle = Bundle(for: MockContactService.self)
        guard let model: [Contact] = FileManager.getJSONObject(from: "ContactList", bundle: bundle) else { return nil }
        return model
    }
}
