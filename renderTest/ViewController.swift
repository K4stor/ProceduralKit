//
//  ViewController.swift
//  renderTest
//
//  Created by Carsten Przyluczky on 28.04.19.
//  Copyright © 2019 Carsten Przyluczky. All rights reserved.
//

import Cocoa
import CoreImage

class ViewController: NSViewController {

    @IBOutlet weak var imageView: NSImageView!
    override func viewDidLoad() {
        super.viewDidLoad()

        guard let inputImage = imageView.image?.ciImage else { return }
        let filter = MetalFilter()
        filter.inputImage = inputImage
        let outputImage = filter.outputImage()
        imageView.image = outputImage?.nsImage
    }

    override var representedObject: Any? {
        didSet {
        // Update the view, if already loaded.
        }
    }


}

