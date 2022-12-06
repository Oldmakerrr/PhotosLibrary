//
//  NetworkService.swift
//  PhotosLibrary
//
//  Created by Apple on 22.01.2022.
//

import Foundation

class NetworkService {
    
    //@escaping - позволяет возвращать кложур
    //построение запроса данных по URL
    
    func request(searchTerm: String, completion: @escaping (Data?, Error?)->() ) {
        
        let params = prepareParaments(searchTerm: searchTerm)
        let url = self.url(params: params)
        var request = URLRequest(url: url)
        request.allHTTPHeaderFields = prepareHeaders()
        request.httpMethod = "get"
        let task = createDataTask(from: request, complition: completion)
        task.resume()
    }
    
    private func prepareHeaders() -> [String:String] {
        var headers = [String:String]()
        headers["Authorization"] = "Client-ID eU3-M2Qv5hZGOKSbvl2GE9gheZE0bB3mWqIusQ1gqYs"
        return headers
    }
    
    // настраиваем параметры по ключам по запросу
    //https://unsplash.com/documentation#search-photos
    private func prepareParaments(searchTerm: String?) -> [String:String] {
        var parameters = [String: String]()
        parameters["query"] = searchTerm
        parameters["page"] = String(1)
        parameters["per_page"] = String(20)
        return parameters
    }
    
    //создаем url по разным компонентам и возвращаем URL
    private func url(params: [String:String])-> URL {
        var components = URLComponents()
        components.scheme = "https" //типа запроса у url
        components.host = "api.unsplash.com"  //название сайта
        components.path = "/search/photos" //путь куда идет запрос
        components.queryItems = params.map{URLQueryItem(name: $0, value: $1)}
        return components.url!
    }
    
    //создаем юрл сессию
    private func createDataTask(from request: URLRequest, complition: @escaping (Data?, Error?)->()) -> URLSessionDataTask {
        return URLSession.shared.dataTask(with: request) { data, response, error in
            DispatchQueue.main.async {
                complition(data,error)
            }
        }
    }
    
    //1. создать url адрес (его структуру) - private func url
    //2. создать параметры которые я хочу получать - private func prepareParaments
    //3. сделать запрос func request
}
