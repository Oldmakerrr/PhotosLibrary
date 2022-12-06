//
//  NetworkDataFetch.swift
//  PhotosLibrary
//
//  Created by Apple on 22.01.2022.
//

import Foundation

class NetworkDataFetcher {
    
    var networkService = NetworkService()
    
    func fetchImages(searchTerm: String, complition: @escaping (SearchResults?)-> ()) {
       networkService.request(searchTerm: searchTerm) { data, error in
            if let error = error {
                print("Error received request data: \(error.localizedDescription)")
                complition(nil)
            }
            let decode = self.decodeJSON(type: SearchResults.self, from: data)
            complition(decode)
        }
    }
    
    func decodeJSON<T: Decodable>(type: T.Type, from: Data?) -> T? {
        let decoder = JSONDecoder()
        guard let data = from else {return nil}
        
        do {
            let objects = try decoder.decode(type.self, from: data)
            return objects
        } catch let jsonError {
            print("Failed to decode JSON, \(jsonError)")
            return nil
        }
    }
    
    
}
