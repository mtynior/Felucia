//
//  Felucia.swift
//  Felucia
//
//  Created by Michał Tynior on 19/10/15.
//  Copyright © 2015 Michał Tynior. All rights reserved.
//

import Foundation

// MARK: - Eqauality operators

func ==(lhs:UIColor, rhs:UIColor) -> Bool {
    let lhsRGBA = lhs.rgba()
    let rhsRGBA = rhs.rgba()
    
    return lhsRGBA.r == rhsRGBA.r
        && lhsRGBA.g == rhsRGBA.g
        && lhsRGBA.b == rhsRGBA.b
        && lhsRGBA.a == rhsRGBA.a
}

func !=(lhs:UIColor, rhs:UIColor) -> Bool {
    return !(lhs == rhs)
}

// MARK: - RGBA - Integer

extension UIColor {
    
    public convenience init(r:Int, g:Int, b:Int, a:Int = 255) {
        let ratioRed = Float(UIColor.clamp(r, minValue: 0, maxValue: 255)) / 255.0
        let ratioGreen = Float(UIColor.clamp(g, minValue: 0, maxValue: 255)) / 255.0
        let ratioBlue = Float(UIColor.clamp(b, minValue: 0, maxValue: 255)) / 255.0
        let ratioAlpha = Float(UIColor.clamp(a, minValue: 0, maxValue: 255)) / 255.0

        self.init(colorLiteralRed: ratioRed, green: ratioGreen, blue: ratioBlue, alpha: ratioAlpha)
    }
    
    func rgba() -> (r:Int, g:Int, b:Int, a:Int) {
        var fRed : CGFloat = 0
        var fGreen : CGFloat = 0
        var fBlue : CGFloat = 0
        var fAlpha: CGFloat = 0
        
        self.getRed(&fRed, green: &fGreen, blue: &fBlue, alpha: &fAlpha)
        let iRed = Int(round(fRed * 255.0))
        let iGreen = Int(round(fGreen * 255.0))
        let iBlue = Int(round(fBlue * 255.0))
        let iAlpha = Int(round(fAlpha * 255.0))
            
        return (iRed, iGreen, iBlue, iAlpha)
    }
    
    func rgbaArray() -> [Int] {
        let components = rgba()
        return [components.r, components.g, components.b, components.a]
    }
    
    private class func clamp(value:Int, minValue:Int, maxValue:Int) -> Int {
        return max(minValue, min(value, maxValue))
    }
}

// MARK: - Hex color 

extension UIColor {
    
    convenience init?(hexARGBString:String) {
        let hex3 = "^#?([0-9a-fA-F]{1})([0-9a-fA-F]{1})([0-9a-fA-F]{1})$"
        let hex6 = "^#?([0-9a-fA-F]{2})([0-9a-fA-F]{2})([0-9a-fA-F]{2})$"
        let hex8 = "^#?([0-9a-fA-F]{2})([0-9a-fA-F]{2})([0-9a-fA-F]{2})([0-9a-fA-F]{2})$"
        
        if let comp = UIColor.getComponents(hexARGBString, pattern: hex3) {
            let r = Int(comp[0] + comp[0], radix:16)!
            let g = Int(comp[1] + comp[1], radix:16)!
            let b = Int(comp[2] + comp[2], radix:16)!
            
            self.init(r:r, g:g, b:b)
        }
        else if let comp = UIColor.getComponents(hexARGBString, pattern: hex6) {
            let r = Int(comp[0], radix:16)!
            let g = Int(comp[1], radix:16)!
            let b = Int(comp[2], radix:16)!
            
            self.init(r:r, g:g, b:b)
        }
        else if let comp = UIColor.getComponents(hexARGBString, pattern: hex8) {
            let a = Int(comp[0], radix:16)!
            let r = Int(comp[1], radix:16)!
            let g = Int(comp[2], radix:16)!
            let b = Int(comp[3], radix:16)!
            
            self.init(r:r, g:g, b:b, a:a)

        }
        else {
            return nil
        }
    }
    
    private class func getComponents(hexString: String, pattern: String) -> [String]? {
        let regex = try! NSRegularExpression(pattern: pattern, options: .CaseInsensitive)
        
        guard let match = regex.firstMatchInString(hexString, options:[], range:NSMakeRange(0, hexString.characters.count)) else  {
            return nil
        }
        
        var components = [String]()
        for index in 1 ..< match.numberOfRanges {
            let component: String = (hexString as NSString).substringWithRange(match.rangeAtIndex(index))
            components.append(component)
        }
        
        return components
    }
    
}

// MARK: - RGBA float

extension UIColor {
    
    public convenience init(red: Float, green: Float, blue: Float){
        self.init(colorLiteralRed: red, green: green, blue: blue, alpha: 1.0)
    }
    
    func rgbaf() -> (r:Float, g:Float, b:Float, a:Float) {
        var fRed : CGFloat = 0
        var fGreen : CGFloat = 0
        var fBlue : CGFloat = 0
        var fAlpha: CGFloat = 0
        
        self.getRed(&fRed, green: &fGreen, blue: &fBlue, alpha: &fAlpha)
        
        return (Float(fRed), Float(fGreen), Float(fBlue), Float(fAlpha))
    }
    
    func rgbafArray() -> [Float] {
        let components = rgbaf()
        return [components.r, components.g, components.b, components.a]
    }
}

// MARK: - HSBA

extension UIColor {
    
    func hsba() -> (h:Float, s:Float, b:Float, a:Float) {
        var hue : CGFloat = 0
        var saturation : CGFloat = 0
        var brightness : CGFloat = 0
        var alpha: CGFloat = 0
        
        self.getHue(&hue, saturation: &saturation, brightness: &brightness, alpha: &alpha)
        
        return (Float(hue), Float(saturation), Float(brightness), Float(alpha))
    }
    
    func hsbaArray() -> [Float] {
        let components = hsba()
        return [components.h, components.s, components.b, components.a]
    }
}

// MARK - HSLA

// http://mjijackson.com/2008/02/rgb-to-hsl-and-rgb-to-hsv-color-model-conversion-algorithms-in-javascript

extension UIColor {
    
    convenience init(h:Float, s:Float, l:Float, a:Float = 1.0) {
        var r:Float
        var g:Float
        var b:Float
        let normalizedH = (h > 1) ? (h / 360.0) : h
        let normalizedS = (s > 1) ? (s / 100.0) : s
        let normalizedL = (l > 1) ? (l / 100.0) : l


        
        if(s == 0){
            r = l // achromatic
            g = l
            b = l
        } else{
            let q = (normalizedL < 0.5) ? (normalizedL * (1 + normalizedS)) : (normalizedL + normalizedS - normalizedL * normalizedS);
            let p = 2 * normalizedL - q;
            r = UIColor.hue2rgb(p, q: q, t1: normalizedH + 1.0/3.0);
            g = UIColor.hue2rgb(p, q: q, t1: normalizedH);
            b = UIColor.hue2rgb(p, q: q, t1: normalizedH - 1.0/3.0);
        }
    
        self.init(colorLiteralRed: r, green: g, blue: b, alpha: a)
    }
    
    class func hue2rgb(p:Float, q:Float,  t1:Float) -> Float {
        var t = t1
        if(t < 0) {t += 1}
        if(t > 1) {t -= 1}
        if(t < 1.0/6.0) {return p + (q - p) * 6.0 * t }
        if(t < 1.0/2.0) {return q }
        if(t < 2.0/3.0) { return p + (q - p) * (2.0/3.0 - t) * 6.0 }
        return p;
    }
    
    func hsla() -> (h:Float, s:Float, l:Float, a:Float) {
        let components = rgbaf()
        let minComponent = min(components.r, components.g, components.b)
        let maxComponent = max(components.r, components.g, components.b)
        var h:Float = 0.0
        var s:Float = 0.0
        let l:Float = (minComponent + maxComponent) / 2.0
        
        if(minComponent == maxComponent) {
            h = 0.0
            s = 0.0
        }
        else {
            let d: Float = maxComponent - minComponent
            s = l > 0.5 ? d / Float(2.0 - maxComponent - minComponent) : d / Float((maxComponent + minComponent))
            switch(maxComponent) {
                case components.r: h = (components.g - components.b) / d + (components.g < components.b ? 6.0 : 0.0)
                case components.g: h = (components.b - components.r) / d + 2.0
                case components.b: h = (components.r - components.g) / d + 4.0
                default: h = 0.0
            }
            
            h /= 6.0;
        }
        
        return (h, s, l, components.a)
    }
    
    func hslaArray() -> [Float] {
        let components = hsla()
        return [components.h, components.s, components.l, components.a]
    }
    
}

// MARK - CMYK

extension UIColor {
    
   convenience init(cyan: Float, magneta: Float, yellow: Float, black: Float) {
        let red = (1 - cyan) * (1 - black)
        let green = (1 - magneta) * (1 - black)
        let blue = (1 - yellow) * (1 - black)
        
        self.init(colorLiteralRed: red, green: green, blue: blue, alpha: 1)
    }
    
    
    func cmyk() -> (c:Float, m:Float, y:Float, k:Float) {
        let components = rgbaf()
        let black = 1 -  max(components.r, components.g, components.b)
        let cyan = (1 - components.r - black) / (1 - black)
        let magneta = (1 - components.g - black) / (1 - black)
        let yellow = (1 - components.b - black) / (1 - black)

        return (cyan, magneta, yellow, black)
    }
    
    func cmykArray() -> [Float] {
        let components = cmyk()
        return [components.c, components.m, components.y, components.k]
    }
}

// MARK: - Utils

extension UIColor {
    
    func complementaryColor() -> UIColor {
        let components = rgbaf()
        
        return UIColor(red: CGFloat(1.0 - components.r),
                     green: CGFloat(1.0 - components.g),
                      blue: CGFloat(1.0 - components.b),
                     alpha: CGFloat(components.a))

    }

    func lighten(percentage: Float = 0.1) -> UIColor {
        var components = hsla()
        
        components.l += percentage
        components.l =  max(0.0, min(components.l, 1.0))
        
        return UIColor(h: components.h, s: components.s, l: components.l)
    }
    
    func darken(percentage: Float = 0.1) -> UIColor {
        var components = hsla()
        
        components.l -= percentage
        components.l =  max(0.0, min(components.l, 1.0))
        
        return UIColor(h: components.h, s: components.s, l: components.l)
    }
    
    func grayscale() -> UIColor {
        let components = rgba()
        
        // https://en.wikipedia.org/wiki/Grayscale#Converting_color_to_grayscale
        var lumaComponent = Float(components.r) * 0.3
            lumaComponent += Float(components.g) * 0.59
            lumaComponent += Float(components.b) * 0.11
        
        let grayComponent = Int(lumaComponent)
        
        return UIColor(r: grayComponent, g: grayComponent, b: grayComponent, a: components.a)
    }
    
    func isLight() -> Bool {
        return !isDark()
    }
    
    func isDark() -> Bool {
        // YIQ equation from http://24ways.org/2010/calculating-color-contrast
        let components = rgba()
        let yiq = (components.r * 299 + components.g * 587 + components.b * 114) / 1000;
        return yiq < 128;
    }
    
    class func randomColor() -> UIColor {
        //  Inspired by https://gist.github.com/kylefox/1689973
        let hue : CGFloat = CGFloat(arc4random() % 256) / 256 // use 256 to get full range from 0.0 to 1.0
        let saturation : CGFloat = CGFloat(arc4random() % 128) / 256 + 0.5 // from 0.5 to 1.0 to stay away from white
        let brightness : CGFloat = CGFloat(arc4random() % 128) / 256 + 0.5 // from 0.5 to 1.0 to stay away from black
        
        return UIColor(hue: hue, saturation: saturation, brightness: brightness, alpha: 1)
    }
    
}