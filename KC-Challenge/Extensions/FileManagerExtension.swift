//
//  FileManagerExtension.swift
//  KC-Challenge
//
//  Created by Brayam Alberto Mora Arias on 28/09/21.
//

import Foundation

extension FileManager {
    
    static func getJSONObject<T: Decodable> (from fileName: String, bundle: Bundle) -> T? {
        guard let url: URL = bundle.url(forResource: fileName, withExtension: "json"),
              let data: Data = try? Data(contentsOf: url)
        else {
            return nil
        }
        return try? JSONDecoder().decode(T.self, from: data)

    }
}
