//
//  Cache.swift
//  StarWars
//
//  Created by Ghassan  albakuaa  on 10/12/20.
//

import Foundation

class Cache
{
    static var sharedCash = Cache()
    
    private let cash: NSCache<NSString,NSData>
    
    private init(cash: NSCache<NSString,NSData> = NSCache<NSString,NSData>())
    {
        self.cash = cash
    }
}

extension Cache
{
    func set(data: Data, url: String)
    {
        let key = NSString(string: url)
        let object = NSData(data: data)
        self.cash.setObject(object, forKey: key)
    }
    
    func get(url: String) -> Data?
    {
        let key = NSString(string: url)
        guard let object = self.cash.object(forKey: key) else {return nil}
        return Data(referencing: object)
    }
    
}

