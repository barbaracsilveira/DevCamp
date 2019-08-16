//
//  TrackHeader.swift
//  DevCamp
//
//  Created by Bárbara Carvalho Silveira on 28/07/19.
//  Copyright © 2019 Bárbara Carvalho Silveira. All rights reserved.
//

import UIKit

final class TrackHeader: UICollectionReusableView {
    
    @IBOutlet private weak var title: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.title.text = nil
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        self.title.text = nil
    }
    
    func setup(title: String) {
        self.title.text = title.uppercased()
    }
}
