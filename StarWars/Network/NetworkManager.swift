//
//  NetworkManager.swift
//  StarWars
//
//  Created by Ghassan  albakuaa  on 10/12/20.
//

import UIKit

typealias CharHandler = (Result<CharList, NetworkError>) ->()

let charList = "https://swapi.dev/api/people/?page="

final class NetworkManager {
    
    static let shared = NetworkManager()
    
    var session: URLSession
    var decoder: JSONDecoder
    
    private init(session: URLSession = URLSession.shared, decoder: JSONDecoder = JSONDecoder())
    {
        self.session = session
        self.decoder = decoder
    }
}

extension NetworkManager {
    
   
    func getCharacterList(page: Int, completion: @escaping CharHandler) {
        
        guard URL(string: charList + "\(page)") != nil else {
            completion(.failure(.badURL))
            return
        }
        
        if let cash = Cache.sharedCash.get(url: charList + "\(page)") {
            
            var result: CharList?
            
            do {
                result = try JSONDecoder().decode(CharList.self, from: cash)
            }
            catch {
                
                print("failed to convert \(error.localizedDescription)")
            }
            
            guard let list = result else {
                
                return
            }
            completion(.success(list))
            return
        }
        
        URLSession.shared.dataTask(with: URL(string: charList + "\(page)").unsafelyUnwrapped, completionHandler: { data, response, error in
            
            guard let data = data, error == nil else {
                print(" wrong")
                return
            }
            
            Cache.sharedCash.set(data: data, url: charList)
            
            var result: CharList?
            do {
                
                
                result = try JSONDecoder().decode(CharList.self, from: data)
            }
            catch {
                
                print("failed  \(error.localizedDescription)")
            }
            
            guard let list = result else {
                return
            }
            completion(.success(list))
        }).resume()
    }
    
   
    func getHome (homeURL: String, completion: @escaping (Home?) -> ()) {
        if let cash = Cache.sharedCash.get(url: homeURL) {
            
            var result: Home?
            
            do {
                result = try JSONDecoder().decode(Home.self, from: cash)
            }
            catch {
                
                print("failed  \(error.localizedDescription)")
            }
            
            guard let home = result else {
                return
            }
            completion(home)
            return
        }
        
        URLSession.shared.dataTask(with: URL(string: homeURL)!, completionHandler: { data, response, error in
            
            guard let data = data, error == nil else {
                print(" wrong")
                return
            }
            
            Cache.sharedCash.set(data: data, url: homeURL)
            
            var result: Home?
            do {
                result = try JSONDecoder().decode(Home.self, from: data)
            }
            catch {
                
                
                print("failed \(error.localizedDescription)")
            }
            
            guard let home = result else {
                return
            }
            completion(home)
        }).resume()
    }
    
    // Fetch Films
    func getFilms(filmUrl: String, completion: @escaping (Film?) -> ()) {
        if let cash = Cache.sharedCash.get(url: filmUrl) {
            
            var result: Film?
            do {
                result = try JSONDecoder().decode(Film.self, from: cash)
            }
            catch {
                print("failed  \(error.localizedDescription)")
            }
            
            
            guard let flck = result else {
                return
            }
            completion(flck)
            return
        }
        
        URLSession.shared.dataTask(with: URL(string: filmUrl)!, completionHandler: { data, response, error in
            
            guard let data = data, error == nil else {
                print("something went wrong")
                return
            }
            
            Cache.sharedCash.set(data: data, url: filmUrl)
            
            var result: Film?
            do {
                result = try JSONDecoder().decode(Film.self, from: data)
            }
            catch {
                print("failed  \(error.localizedDescription)")
            }
            
            
            guard let flcks = result else {
                return
            }
            completion(flcks)
        }).resume()
        
    }
}



