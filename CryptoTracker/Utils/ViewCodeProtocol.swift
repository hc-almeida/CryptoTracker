//
//  ViewCodeProtocol.swift
//  CryptoTracker
//
//  Created by Hellen on 06/11/21.
//

import Foundation

protocol ViewCodeProtocol {
    
    func buildViewHierarchy()
    func addConstraints()
    func additionalConfiguration()
    func setup()
}

extension ViewCodeProtocol {
    func setup() {
        buildViewHierarchy()
        addConstraints()
        additionalConfiguration()
    }
}
