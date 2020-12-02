//
//  BuilderProtocol.swift
//  Emoji
//
//  Created by Luis Costa on 02/12/2020.
//

import UIKit

protocol BuilderProtocol {
    associatedtype T
    
    func build() -> T
}
