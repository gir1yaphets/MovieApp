//
//  MovieData.swift
//  MovieMvvmApp
//
//  Created by Xiaolue Peng on 2/25/20.
//  Copyright © 2020 xiaoluepeng. All rights reserved.
//

import Foundation

struct MovieData : Codable {
    let feed : Feed
}

struct Feed : Codable {
//    let author: Author
    let entry: [Entry]
//    let updated, rights, title, icon: Icon
//    let link: [FeedLink]
//    let id: Icon
}

//struct Author  : Codable {
//    let name, uri: Icon
//}
//
struct Icon  : Codable {
    let label: String
}

struct Entry  : Codable {
    let imName: Icon
//    let rights: Icon?
//    let imImage: [IMImage]
//    let summary: Icon
//    let imRentalPrice: IMPrice?
//    let imPrice: IMPrice
//    let imContentType: IMContentType
//    let title: Icon
//    let link: [EntryLink]
//    let id: ID
//    let imArtist: Icon
//    let category: Category
//    let imReleaseDate: IMReleaseDate
}

extension Entry {
    enum CodingKeys : String, CodingKey {
        case imName = "im:name"
    }
}

//struct Category  : Codable {
//    let attributes: CategoryAttributes
//}
//
//struct CategoryAttributes  : Codable {
//    let imID, term: String
//    let scheme: String
//    let label: String
//}
//
//struct ID  : Codable {
//    let label: String
//    let attributes: IDAttributes
//}
//
//struct IDAttributes  : Codable {
//    let imID: String
//}
//
//struct IMContentType  : Codable {
//    let attributes: IMContentTypeAttributes
//}
//
//struct IMContentTypeAttributes  : Codable {
//    let term, label: Label
//}
//
//enum Label : String, Codable{
//    case movie
//}
//
//struct IMImage  : Codable {
//    let label: String
//    let attributes: IMImageAttributes
//}
//
//struct IMImageAttributes  : Codable {
//    let height: String
//}
//
//struct IMPrice  : Codable {
//    let label: String
//    let attributes: IMPriceAttributes
//}
//
//struct IMPriceAttributes  : Codable {
//    let amount: String
////    let currency: Currency
//}
//
//enum Currency {
//    case usd
//}
//
//struct IMReleaseDate  : Codable {
//    let label: Date
//    let attributes: Icon
//}
//
//struct EntryLink  : Codable {
//    let attributes: PurpleAttributes
//    let imDuration: Icon?
//}
//
//struct PurpleAttributes  : Codable {
//    let rel: Rel
//    let type: TypeEnum
//    let href: String
//    let title: Title?
//    let imAssetType: IMAssetType?
//}
//
//enum IMAssetType : String, Codable {
//    case preview
//}
//
//enum Rel : String, Codable{
//    case alternate
//    case enclosure
//}
//
//enum Title : String, Codable {
//    case preview
//}
//
//enum TypeEnum : String, Codable {
//    case textHTML
//    case videoXM4V
//}
//
//struct FeedLink  : Codable {
//    let attributes: FluffyAttributes
//}
//
//struct FluffyAttributes  : Codable {
//    let rel: String
//    let type: TypeEnum?
//    let href: String
//}
