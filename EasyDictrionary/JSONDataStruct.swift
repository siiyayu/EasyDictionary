//
//  JsonData.swift
//  EasyDictrionary
//
//  Created by Андрей Беляев on 23/04/2019.
//  Copyright © 2019 Андрей Беляев. All rights reserved.
//

import Foundation

struct JSONdataStruct: Decodable {
    var def: [article]
    enum CodingKeys: String, CodingKey {
        case def
    }
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.def = try container.decode([article].self, forKey: .def)
    }
}

struct article: Decodable {
    var text: String
    var ts: String
    var tr: [translate]
    enum CodingKeys: String, CodingKey {
        case text
        case ts
        case tr
    }
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.text = try container.decode(String.self, forKey: .text)
        self.ts = try container.decode(String.self, forKey: .ts)
        self.tr = try container.decode([translate].self, forKey: .tr)
    }
}

struct translate: Decodable {
    var text: String
    var syn: [synonim]
    enum CodingKeys: String, CodingKey {
        case text
        case syn
    }
//    enum SynonimsCodingKeys: String, CodingKey {
//        case text
//    }
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.text = try container.decode(String.self, forKey: .text)
        self.syn = try container.decode([synonim].self, forKey: .syn)
    }
}

struct synonim: Decodable {
    var text: String
    enum CodingKeys: String, CodingKey {
        case text
    }
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.text = try container.decode(String.self, forKey: .text)
    }
}

