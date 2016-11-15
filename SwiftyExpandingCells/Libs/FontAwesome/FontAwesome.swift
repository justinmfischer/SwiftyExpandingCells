// FontAwesome.swift
//
// Copyright (c) 2014-2015 Thi Doan
//
// Permission is hereby granted, free of charge, to any person obtaining a copy
// of this software and associated documentation files (the "Software"), to deal
// in the Software without restriction, including without limitation the rights
// to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
// copies of the Software, and to permit persons to whom the Software is
// furnished to do so, subject to the following conditions:
//
// The above copyright notice and this permission notice shall be included in
// all copies or substantial portions of the Software.
//
// THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
// IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
// FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
// AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
// LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
// OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
// THE SOFTWARE.

import UIKit
import CoreText

private class FontLoader {
    class func loadFont(_ name: String) {
        let bundle = Bundle(for: FontLoader.self)
        var fontURL: URL!
        let identifier = bundle.bundleIdentifier

        if identifier?.hasPrefix("org.cocoapods") == true {
            // If this framework is added using CocoaPods, resources is placed under a subdirectory
            fontURL = bundle.url(forResource: name, withExtension: "otf", subdirectory: "FontAwesome.swift.bundle")!
        } else {
            fontURL = bundle.url(forResource: name, withExtension: "otf")!
        }

        let data = try! Data(contentsOf: fontURL)

        let provider = CGDataProvider(data: data as! CFData)
        let font = CGFont(provider!)

        var error: Unmanaged<CFError>?
        if !CTFontManagerRegisterGraphicsFont(font, &error) {
            let errorDescription: CFString = CFErrorCopyDescription(error!.takeUnretainedValue())
            let nsError = error!.takeUnretainedValue() as AnyObject as! NSError
            NSException(name: NSExceptionName.internalInconsistencyException, reason: errorDescription as String, userInfo: [NSUnderlyingErrorKey: nsError]).raise()
        }
    }
}

public extension UIFont {
    public class func fontAwesomeOfSize(_ fontSize: CGFloat) -> UIFont {
        struct Static {
            static var onceToken : Int = 0
        }

        let name = "FontAwesome"
        if (UIFont.fontNames(forFamilyName: name).count == 0) {
                FontLoader.loadFont(name)
        }

        return UIFont(name: name, size: fontSize)!
    }
}

public extension String {
    public static func fontAwesomeIconWithName(_ name: FontAwesome) -> String {
        return name.rawValue.substring(to: name.rawValue.characters.index(name.rawValue.startIndex, offsetBy: 1))
    }
}

public extension UIImage {
    public static func fontAwesomeIconWithName(_ name: FontAwesome, textColor: UIColor, size: CGSize) -> UIImage {
        let paragraph = NSMutableParagraphStyle()
        paragraph.lineBreakMode = NSLineBreakMode.byWordWrapping
        paragraph.alignment = .center
        let attributedString = NSAttributedString(string: String.fontAwesomeIconWithName(name) as String, attributes: [NSFontAttributeName: UIFont.fontAwesomeOfSize(max(size.width, size.height)), NSForegroundColorAttributeName: textColor, NSParagraphStyleAttributeName:paragraph])
        let size = sizeOfAttributeString(attributedString, maxWidth: size.width)
        UIGraphicsBeginImageContextWithOptions(size, false , 0.0)
        attributedString.draw(in: CGRect(x: 0, y: 0, width: size.width, height: size.height))
        let image = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        return image!
    }
}

func sizeOfAttributeString(_ str: NSAttributedString, maxWidth: CGFloat) -> CGSize {
    let size = str.boundingRect(with: CGSize(width: maxWidth, height: 1000), options:(NSStringDrawingOptions.usesLineFragmentOrigin), context:nil).size
    return size
}
