//
//  Word.swift
//  EasyDictrionary
//
//  Created by Андрей Беляев on 20/04/2019.
//  Copyright © 2019 Андрей Беляев. All rights reserved.
//

import Foundation
import UIKit

struct CurrentWord{
    let word: String
    let translation: String
    let transcription: String
    var synonims: [String]
    //let synonims: [String]
}

extension CurrentWord: JSONDecodable {
    init(JSON: JSONdataStruct) {
    self.word = JSON.def[0].text
    self.transcription = JSON.def[0].ts
    self.translation = JSON.def[0].tr[0].text
    self.synonims = []
        for item in JSON.def[0].tr[0].syn {
            self.synonims.append(item.text)
        }
    }
}
