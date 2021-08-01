//
//  Extension.swift
//  Piano Practice App
//
//  Created by Jin Park on 8/2/21.
//

import Foundation

extension Date {
    func toString( dateFormat format  : String ) -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = format
        return dateFormatter.string(from: self)
    }
}
