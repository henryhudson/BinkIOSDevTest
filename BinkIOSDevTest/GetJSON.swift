//
//  GetJSON.swift
//  Stonks (iOS)
//
//  Created by Henry Hudson on 27/07/2020.
//

import SwiftUI

func getJSON<T: Decodable>(urlString: String, completion: @escaping (T?) -> Void) {
    guard let url = URL(string: urlString) else {
        return
    }
    let request = URLRequest(url: url)
    URLSession.shared.dataTask(with: request) { (data, response, error) in
        if let error = error {
            print(error.localizedDescription)
            completion(nil)
            return
        }
        guard let data = data else {
            completion(nil)
            return
        }
        
        let decoder = JSONDecoder()
        decoder.dateDecodingStrategy = .secondsSince1970
        guard let decodedData = try? decoder.decode(T.self, from: data) else {
            completion(nil)
            return
        }
        completion(decodedData)
    }.resume()
}
