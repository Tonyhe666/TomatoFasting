//
//  UIColor+Extension.swift
//  TomatoFasting
//
//  Created by heliang on 2022/6/13.
//

import Foundation
import UIKit
extension UIColor {
    /// 使用十六进制颜色码生成`UIColor`对象, eg:`UIColor(0xFF2D3A)`
    /// - Parameters:
    ///   - hexValue: 十六进制数值
    ///   - alpha: alpha, default: 1.0, alpha取值范围是[0...1]
    convenience public init(_ hexValue: Int, alpha: Float = 1.0) {
        self.init(red: CGFloat((hexValue & 0xFF0000) >> 16) / 255.0,
                green: CGFloat((hexValue & 0x00FF00) >> 8) / 255.0,
                 blue: CGFloat(hexValue & 0x0000FF) / 255.0,
                alpha: CGFloat(alpha))
    }
    
    /// 获取 UIColor
    ///
    /// - Parameters:
    ///   - r: 红    取值: 0-255
    ///   - g: 绿    取值: 0-255
    ///   - b: 蓝    取值: 0-255
    convenience init(r: UInt8, g: UInt8, b: UInt8, alpha: Float = 1.0) {
        self.init(red: CGFloat(r) / 255.0, green:  CGFloat(g) / 255.0, blue:  CGFloat(b) / 255.0, alpha: CGFloat(alpha))
    }
    
    /// 随机色
    class var random: UIColor {
        return UIColor(r: UInt8(arc4random_uniform(256)), g: UInt8(arc4random_uniform(256)), b: UInt8(arc4random_uniform(256)))
    }
    
    // 颜色生成图片
    func image(_ size: CGSize = CGSize(width: 1, height: 1)) -> UIImage {
        return UIGraphicsImageRenderer(size: size).image { rendererContext in
            self.setFill()
            rendererContext.fill(CGRect(origin: .zero, size: size))
        }
    }
    
    // 颜色生成图片圆角
    func image(_ size: CGSize = CGSize(width: 1, height: 1), cornerRadius: CGFloat) -> UIImage {
        return UIGraphicsImageRenderer(size: size).image { rendererContext in
            self.setFill()
            
            rendererContext.fill(CGRect(origin: .zero, size: size))
        }
    }
}


extension UIColor {
    static var colorMain: UIColor {
        return UIColor(0xFF6698)
    }
    
    static var color333: UIColor {
        return UIColor(0x333333)
    }
    
    static var color666: UIColor {
        return UIColor(0x666666)
    }
    
    static var color777: UIColor {
        return UIColor(0x777777)
    }
    
    static var color888: UIColor {
        return UIColor(0x888888)
    }
    
    static var color999: UIColor {
        return UIColor(0x999999)
    }
    
    static var colorF8: UIColor {
        return UIColor(0xF8F8F8)
    }
    
    static var colorD8: UIColor {
        return UIColor(0xD8D8D8)
    }
    
    static var colorE5: UIColor {
        return UIColor(0xE5E5E5)
    }
    
    static var colorEEE: UIColor {
        return UIColor(0xEEEEEE)
    }
}

