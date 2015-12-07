#Felucia  [![Build Status](https://travis-ci.org/mtynior/Felucia.svg?branch=master)](https://travis-ci.org/mtynior/Felucia) [![Swift 2.0](https://img.shields.io/badge/language-Swift-orange.svg?style=flat)](https://developer.apple.com/swift/) [![License](https://img.shields.io/badge/license-MIT-blue.svg)](https://github.com/mtynior/Felucia/blob/master/LICENSE.md) [![CocoaPods](https://img.shields.io/cocoapods/v/Felucia.svg)](https://cocoapods.org/pods/Felucia)  [![Carthage](https://img.shields.io/badge/Carthage-compatible-4BC51D.svg?style=flat)](https://github.com/Carthage/Carthage)

Felucia provides useful extensions to UIColor.

## Requirements

- iOS 8.1+
- Xcode 7.1+

##Integration

####CocoaPods
You can use [CocoaPods](http://cocoapods.org/) to install `Felucia` by adding it to your `Podfile`:

```ruby
platform :ios, '8.1'
use_frameworks!

target 'MyApp' do
	pod 'Felucia'
end
```
Run `pods install` to intagrate pods with your project.

####Carthage
You can use [Carthage](https://github.com/Carthage/Carthage) to install `Felucia ` by adding it to your `Cartfile`:

```
github "mtynior/Felucia"

```
Run `carthage update` to build the framework and drag the built `Felucia.framework` into your Xcode project.

####Manually
You can also manually add Felucia to you project:

1. Download `Felucia.swift` file,
2. Drag `Felucia.swift` into you project's tree.

## Usage

### Color initialization

#### Hex ARGB string

```swift
UIColor(hexARGBString:"#fff")
UIColor(hexARGBString:"fff")
UIColor(hexARGBString:"#e2f5d3")
UIColor(hexARGBString:"e2f5d3")
UIColor(hexARGBString:"#ffe2f5d3")
UIColor(hexARGBString:"ffe2f5d3")
``` 

#### RGBA 

```swift
UIColor(r:255, g:128, b:64, a:255)
UIColor(r:255, g:128, b:64)

UIColor(red:1.0, green:0.5, blue:0.25, alpha:1.0)
UIColor(red:1.0, green:0.5, blue:0.25)
``` 

#### CMYK

```swift
UIColor(cyan: 0, magneta: 0.5, yellow: 0.75, black: 0.498)
``` 

#### HSLA 
The `h` can be set as value in [0, 1] or [0, 360].

The `s` can be set as value in `l` are in [0, 1] or [0, 100]. 

The `a` can be set as value in [0, 1].

```swift
UIColor(h: 157.0, s: 24, l: 51)
UIColor(h: 0.436, s: 0.24, l: 0.51)
UIColor(h: 0.436, s: 0.24, l: 0.51, a: 1.0)
``` 


### Retrieving color components

```swift
UIColor(r:255, g:128, b:64, a:255).rgba() // (r:255, g:128, b:64, a:255)
UIColor(r:255, g:128, b:64, a:255).rgbaArray() // [255, 128, 64, 255]

UIColor(r:255, g:128, b:64, a:255).rgbaf() // (r:1.0, g:0.5, b:0.25, a:1.0)
UIColor(r:255, g:128, b:64, a:255).rgbafArray() // [1.0, 0.5, 0.25, 1.0]

UIColor(r:255, g:128, b:64, a:255).hsba() // (h:0.056, s:0.749, b:1.0, a:1.0)
UIColor(r:255, g:128, b:64, a:255).hsbaArray() // [0.056, 0.749, 1.0, 1.0]

UIColor(r:255, g:128, b:64, a:255).hsla() // (h:0.0558464, s:1.0, l:0.62549, a:1.0)
UIColor(r:255, g:128, b:64, a:255).hslaArray() // [0.0558464, 1.0, 0.62549, a:1.0]

UIColor(r:255, g:128, b:64, a:255).cmyk() // (c:0.0, m:0.498, y:0.749, k:0.0)
UIColor(r:255, g:128, b:64, a:255).cmykArray() // [0.0, 0.498, 0.749, 0.0]
```

### Utilities

#### Complementary
Returns complementary color.

```swift
let color = UIColor.whiteColor().complementaryColor() 
color.rgba() // (r:0, g:0, b:0, a:255)
```

#### Lighten
Lightens the color a given amount, from 0.0 to 1.0. Providing 1.0 will always return white.

```swift
let color = UIColor.redColor().lighten()
color.rgba() // (r:255, g:51, b:51, a:255)
```

```swift
let color = UIColor.redColor().lighten(1.0)
color.rgba() // (r:255, g:255, b:255, a:255)
```

#### Darken
Darkens the color a given amount, from 0.0 to 1.0. Providing 1.0 will always return black.

```swift
let color = UIColor.redColor().darken()
color.rgba() // (r:204, g:0, b:0, a:255)
```
```swift
let color = UIColor.redColor().darken(1.0)
color.rgba() // (r:0, g:0, b:0, a:255)
```

#### Grayscale
Desaturates a color into greyscale.

```swift
let color = UIColor(r: 67, g: 122, b: 134).grayscale()
color.rgba() // (r:106, g:106, b:106, a:255)
```

#### IsLight
Returns `true` when the color's perceived brightness is light.

```swift
UIColor.whiteColor().isLight() // true

UIColor.blackColor().isLight() // false
```

#### IsDark
Returns `true` when the color's perceived brightness is dark.

```swift
UIColor.blackColor().isLight() // true

UIColor.whiteColor().isLight() // false
```

#### Random
Returns a random color.

```swift
let color = UIColor.randomColor()
color.rgba() // (r: 67, g: 122, b: 134 a:255)
```

##License

Felucia is released under the MIT license. See LICENSE for details.