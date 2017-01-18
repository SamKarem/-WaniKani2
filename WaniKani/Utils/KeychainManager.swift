//
//  KeychainManager.swift
//  WaniKani
//
//  Created by Andriy K. on 2/2/16.
//  Copyright © 2016 Andriy K. All rights reserved.
//

import UIKit
import UICKeyChainStore

struct KeychainManager {
  
  let apiKeyStoreKey = "WaniKaniApiKey"
  let userKey = "userKey"
  let passwordKey = "passwordKey"
  
  let keychain = UICKeyChainStore(service: "com.haawa.WaniKani")
  let firstRunDefaultsKey = "FirstRun"
  let firstRunValue = "1strun"
  
  func cleanKeychainIfNeeded() {
    
    if (UserDefaults.standard.object(forKey: firstRunDefaultsKey) == nil) {
      keychain[apiKeyStoreKey] = nil
      
      UserDefaults.standard.setValue(firstRunValue, forKey: firstRunDefaultsKey)
      UserDefaults.standard.synchronize()
    }
  }
  
  func wipeKeychain() {
    keychain[apiKeyStoreKey] = nil
    keychain[userKey] = nil
    keychain[passwordKey] = nil
  }
  
  var apiKey: String? {
    return keychain[apiKeyStoreKey]
  }
  
  func setNewApiKey(_ key: String) {
    keychain[apiKeyStoreKey] = key
  }
  
  var user: String? {
    return keychain[userKey]
  }
  
  func setUsername(_ usr: String) {
    keychain[userKey] = usr
  }
  
  var password: String? {
    return keychain[passwordKey]
  }
  
  func setPassword(_ passw: String) {
    keychain[passwordKey] = passw
  }
  
}
