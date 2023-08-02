//
//  ISO8601DateCoder.swift
//  ArticlesTest
//
//  Created by Diachenko Ihor on 31.07.2023.
//

import Foundation

final class ISO8601DateCoder: DateCoder {
    override class var formatter: DateFormatter? {
        .iso8601
    }
}

