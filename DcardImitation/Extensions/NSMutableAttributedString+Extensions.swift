//
//  NSMutableAttributedString+Extensions.swift
//  DcardImitation
//
//  Created by Machir on 2021/8/31.
//

import Foundation
import UIKit

extension NSMutableAttributedString {
    func append(string: String) {
        self.append(NSAttributedString(string: string + "\n"))
    }
    func append(imageSource: String, labelText: UILabel) {
        guard let url = URL(string: imageSource) else { return }
        UIImage.image(from: url) { image in
            guard let image = image else { return }
            let scaledImage = image.scaled(with: UIScreen.main.bounds.width / image.size.width * 0.9)
            let attachment = NSTextAttachment()
            attachment.image = scaledImage
            self.append(NSAttributedString(attachment: attachment))
            self.append(NSAttributedString(string: "\n"))
        }
    }
}
