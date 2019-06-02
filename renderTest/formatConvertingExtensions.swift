//
//  formatConvertingExtensions.swift
//  renderTest
//
//  Created by Carsten Przyluczky on 28.04.19.
//  Copyright © 2019 Carsten Przyluczky. All rights reserved.
//

import Foundation
import Cocoa

extension NSImage {
    public var cgImage: CGImage? {
        guard let imageData = self.tiffRepresentation else { return nil }
        guard let sourceData = CGImageSourceCreateWithData(imageData as CFData, nil) else { return nil }
        return CGImageSourceCreateImageAtIndex(sourceData, 0, nil)
    }
}

extension NSImage {
    public var ciImage: CIImage? {
        guard let imageData = self.tiffRepresentation else { return nil }
        return CIImage(data: imageData)
    }
}

extension CGImage {
    public var nsImage: NSImage? {
        let size = CGSize(width: self.width, height: self.height)
        return NSImage(cgImage: self, size: size)
    }
}

extension CGImage {
    public var ciImage: CIImage {
        return CIImage(cgImage: self)
    }
}

extension CIImage {
    public var nsImage: NSImage {
        let rep = NSCIImageRep(ciImage: self)
        let nsImage = NSImage(size: rep.size)
        nsImage.addRepresentation(rep)
        return nsImage
    }
}

extension CIImage {
    public var cgImage: CGImage? {
        let context = CIContext(options: nil)
        return context.createCGImage(self, from: self.extent)
    }
}

