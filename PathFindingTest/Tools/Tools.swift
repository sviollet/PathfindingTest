//
//  Tools.swift
//  PathFindingTest
//
//  Created by samuel on 09/05/2017.
//
//

import Foundation


func indicesOf<T: Equatable>(x: T, array: [[T]]) -> (Int, Int)? {
    
    
    //let test = array.enumerated()
    
    for (i, row) in array.enumerated() {
        
        if let j = row.index(of: x) {
            return (i, j)
        }
    }
    return nil
}
