//
//  Model.swift
//  IntelliPlus
//
//  Created by user on 3/4/23.
//

import Foundation

struct DataResponse: Decodable{
    let url: String
}

struct ModelResponse: Decodable{
    let data: [DataResponse]
}
