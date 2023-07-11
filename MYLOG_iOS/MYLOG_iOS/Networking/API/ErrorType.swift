//
//  ErrorType.swift
//  MYLOG_iOS
//
//  Created by 강인혜 on 2023/07/10.
//

import Foundation

public enum BaseErrorType: Error {
    case badRequest
    case unauthorized
    case forbidden
    case notFound
    case conflict
}
