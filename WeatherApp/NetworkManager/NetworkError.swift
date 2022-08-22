//
//  NetworkError.swift
//  WeatherApp
//
//  Created by Руслан Магомедов on 21.08.2022.
//

import Foundation

enum NetworkError: Error {
    case `default`
    case serverError
    case parseError(reason: String)
    case unknownError
}
