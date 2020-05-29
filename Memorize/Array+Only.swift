//
//  Array+Only.swift
//  Memorize
//
//  Created by Alberto Lagos Toro on 29-05-20.
//  Copyright © 2020 Alberto Lagos Toro. All rights reserved.
//

import Foundation

extension Array {
    var only: Element? {
        count == 1 ? first : nil
    }
}
