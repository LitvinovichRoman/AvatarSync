//
//  DataManger.swift
//  AvatarSync
//
//  Created by Roman Litvinovich on 14.08.24.
//

import UIKit

class DataManger {
    private enum SettingKey: String {
        case avatar
        case age
        case weight
        case height
    }
    
    static var avatar: UIImage? {
        get {
            guard let data = UserDefaults.standard.data(forKey: SettingKey.avatar.rawValue) else {
                return nil
            }
            return UIImage(data: data)
        }
        set {
            let defaults = UserDefaults.standard
            let key = SettingKey.avatar.rawValue
            if let avatar = newValue {
                if let data = avatar.pngData() {
                    defaults.set(data, forKey: key)
                }
            } else {
                defaults.removeObject(forKey: key)
            }
        }
    }
    
    
    static var age: Int! {
        get {
            return UserDefaults.standard.integer(forKey: SettingKey.age.rawValue)
        }
        set {
            let defaults = UserDefaults.standard
            let key = SettingKey.age.rawValue
            
            if let age = newValue {
                print("value: \(age) was added to key \(key)")
                defaults.set(age, forKey: key)
            } else {
                defaults.removeObject(forKey: key)
            }
        }
    }
    
    static var weight: Int! {
        get {
            return UserDefaults.standard.integer(forKey: SettingKey.weight.rawValue)
        }
        set {
            let defaults = UserDefaults.standard
            let key = SettingKey.weight.rawValue
            
            if let weight = newValue {
                print("value: \(weight) was added to key \(key)")
                defaults.set(weight, forKey: key)
            } else {
                defaults.removeObject(forKey: key)
            }
        }
    }
    
    static var height: Int! {
        get {
            return UserDefaults.standard.integer(forKey: SettingKey.height.rawValue)
        }
        set {
            let defaults = UserDefaults.standard
            let key = SettingKey.height.rawValue
            
            if let height = newValue {
                print("value: \(height) was added to key \(key)")
                defaults.set(height, forKey: key)
            } else {
                defaults.removeObject(forKey: key)
            }
        }
    }
}

