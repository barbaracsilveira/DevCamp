//
//  TrackCell.swift
//  DevCamp
//
//  Created by Bárbara Carvalho Silveira on 28/07/19.
//  Copyright © 2019 Bárbara Carvalho Silveira. All rights reserved.
//

import UIKit

protocol TrackCellDelegate: AnyObject {
    func didSelectCard(movie: MovieModel)
}

final class TrackCell: UICollectionViewCell {
    
    @IBOutlet private weak var collectionView: UICollectionView!
    private var delegate: TrackCellDelegate?
    private var movies: [MovieModel] = []
    private let interSpace: CGFloat = UIDevice.isTV() ? 32 : 16
    
    override var canBecomeFocused: Bool {
        return false
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.registerCell()
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        self.movies = []
        self.delegate = nil
    }
    
    func setup(movies: [MovieModel], delegate: TrackCellDelegate) {
        self.movies = movies
        self.delegate = delegate
        self.collectionView.reloadData()
    }
    
    private func registerCell() {
        let identifier = String(describing: CardCell.self)
        self.collectionView.register(UINib(nibName: identifier, bundle: nil), forCellWithReuseIdentifier: identifier)
    }
}


extension TrackCell: UICollectionViewDelegate, UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.movies.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cardCell = collectionView.dequeueReusableCell(withReuseIdentifier: String(describing: CardCell.self), for: indexPath) as! CardCell
        if let image = self.movies[safeIndex: indexPath.item]?.cardImage, !image.isEmpty {
            cardCell.setup(with: URL(string: image))
        }
        return cardCell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 0, left: 16, bottom: 0, right: 16)
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        guard let movie = self.movies[safeIndex: indexPath.item] else { return }
        self.delegate?.didSelectCard(movie: movie)
    }
}


extension TrackCell: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CardCell.getSize(for: collectionView.frame.width)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return interSpace
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return interSpace
    }
}
