//
//  Level.swift
//  WaniKani
//
//  Created by Andriy K. on 3/31/17.
//  Copyright © 2017 haawa. All rights reserved.
//

import Foundation
import RealmSwift
import WaniModel

public class Level: Object {

  dynamic var level = 0
  var radicals = List<RadicalInfo>()
  var kanji = List<KanjiInfo>()
  var words = List<WordInfo>()
  
  public func kanjiListUpdated(newKanji: [WaniModel.KanjiInfo]) {
    kanji = List<KanjiInfo>()
    kanji.append(contentsOf: newKanji.map { KanjiInfo(model: $0) })
  }
  
  public var kanjiModles: [WaniModel.KanjiInfo] {
    return kanji.map { $0.waniModelStruct }
  }
  
}
