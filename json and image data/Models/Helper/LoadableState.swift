//
//  LoadableState.swift
//  json and image data
//
//  Created by Hyung-Jin Kim on 2019/12/17.
//  Copyright © 2019 home. All rights reserved.
//

import Foundation

enum LoadableState<T> {
    case loading
    case fetched(Result<T, FetchError>)
}

enum FetchError: Error {
    case error(String)
    
    var localizedDescription: String {
        switch self {
        case.error(let message):
            return message
        }
    }
}
