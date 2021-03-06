//
//  Response+Unbox.swift
//  Moya-Unbox
//
//  Created by Ryoga Kitagawa on 9/12/16.
//  Copyright © 2016 Ryoga Kitagawa. All rights reserved.
//

import Foundation
import Moya
import Unbox

public extension Response {
    public func mapObject<T: Unboxable>(type: T.Type) throws -> T {
        guard let json = try mapJSON() as? UnboxableDictionary else {
            throw Error.JSONMapping(self)
        }
        return try Unbox(json)
    }
    
    public func mapArray<T: Unboxable>(type: T.Type) throws -> [T] {
        guard let jsonArray = try mapJSON() as? [UnboxableDictionary] else {
            throw Error.JSONMapping(self)
        }
        return try Unbox(jsonArray)
    }
}
