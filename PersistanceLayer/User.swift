//
//  User.swift
//  WaniKani
//
//  Created by Andriy K. on 3/31/17.
//  Copyright © 2017 haawa. All rights reserved.
//

import Foundation
import RealmSwift

class User: Object {

  dynamic var userInfo: UserInfo?
  dynamic var studyQueue: StudyQueueInfo?
  dynamic var srs: SRSDistributionInfo?
  dynamic var kanjiList: ReviewItemsList?

}
