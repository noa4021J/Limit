//
//  ColorThemeSource.swift
//  Limit
//
//  Created by Syunsuke Nakao on 2019/06/17.
//  Copyright © 2019 Syunsuke Nakao. All rights reserved.
//

import Foundation

public enum ColorTheme: String, CaseIterable {
    case NearMoon = "NearMoon"
    case NightFade = "NightFade"
    case TrueSunset = "TrueSunset"
    case SummerGames = "SummerGames"
    case PurpleDivision = "PurpleDivision"
    case YoungGrass = "YoungGrass"
    case RipeMalinka = "RipeMalinka"
    case FrozenBerry = "FrozenBerry"
    case StrongStick = "StrongStick"
    case RedSalvation = "RedSalvation"
    case HiddenJaguar = "HiddenJaguar"
    case SolidStone = "SolidStone"
    
    var hexCodeSet:(String,String) {
        get {
            switch self {
            case .NearMoon:
                return ("#88d3ce","#6e45e2")
            case .NightFade:
                return ("#a18cd1","#fbc2eb")
            case .TrueSunset:
                return ("#fa709a","#fee140")
            case .SummerGames:
                return ("#92fe9d","#00c9ff")
            case .PurpleDivision:
                return ("#7028e4","#e5b2ca")
            case .YoungGrass:
                return ("#9be15d","#00e3ae")
            case .RipeMalinka:
                return ("##f093fb","##f5576c")
            case .FrozenBerry:
                return ("#e8198b","#c7eafd")
            case .StrongStick:
                return ("#a8caba","#5d4157")
            case .RedSalvation:
                return ("#f43b47","#453a94")
            case .HiddenJaguar:
                return ("#0fd850","#f9f047")
            case .SolidStone:
                return ("#243949","#517fa4")
            }
        }
    }
}

public class ColorThemeSource {
    
    static var currentTheme: ColorTheme {
        
        if let theme = UserDefaults.standard.getColorTheme(forkey: "CurrentColorTheme") {
            return theme
        }
        
        return .NearMoon
    }
    
    func getThemeList() -> [ColorTheme] {
        return ColorTheme.allCases
    }
    
    func setColorTheme(_ theme: ColorTheme) {
        UserDefaults.standard.setColorTheme(theme, forkey: "CurrentColorTheme")
    }
    
}
