//
//  SearchResults.swift
//  PhotosLibrary
//
//  Created by Apple on 22.01.2022.
//

import Foundation

struct SearchResults: Decodable {
    let total: Int
    let results: [UnsplashPhoto]
}

struct UnsplashPhoto: Decodable {
    let width: Int
    let height: Int
    let urls: [urlKind.RawValue : String]
}

enum urlKind: String {
    case raw
    case full
    case regular
    case small
    case thumb
}
