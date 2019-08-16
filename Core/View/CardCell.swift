//
//  CardCell.swift
//  DevCamp
//
//  Created by Bárbara Carvalho Silveira on 28/07/19.
//  Copyright © 2019 Bárbara Carvalho Silveira. All rights reserved.
//

import UIKit
import SDWebImage

final class CardCell: UICollectionViewCell {
    
    @IBOutlet private weak var cardImage: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.cardImage.image = nil
        self.contentView.layer.cornerRadius = 3
        self.cardImage.layer.cornerRadius = 3
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        self.cardImage.image = nil
    }
    
    func setup(with image: URL?) {
        self.cardImage.sd_setImage(with: image, completed: nil)
    }
    
    static func getSize(for width: CGFloat) -> CGSize {
        let aspectRatio: CGFloat = 215/290
        let columnCount: CGFloat = UIDevice.isTV() ? 7.5 : 2.5
        let interSpace: CGFloat = UIDevice.isTV() ? 32 : 8
        let width = (width - interSpace * (columnCount - 1)) / columnCount
        return CGSize(width: floor(width), height: floor(width/aspectRatio))
    }
}
