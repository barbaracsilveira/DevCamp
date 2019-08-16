//
//  HomeViewController.swift
//  DevCamp
//
//  Created by Bárbara Carvalho Silveira on 28/07/19.
//  Copyright © 2019 Bárbara Carvalho Silveira. All rights reserved.
//

import UIKit

final class HomeViewController: UIViewController {

    @IBOutlet private weak var collectionView: UICollectionView!
    private var tracks: [TrackModel] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.title = "Explore"
        self.fetch()
        self.registerHeader()
        self.registerCell()
    }
    
    private func fetch() {
        DispatchQueue.global(qos: .background).async {
            HomeRequest.fetch { (tracks, error) in
                self.setTracks(tracks)
            }
        }
    }
    
    private func registerHeader() {
        let identifier = String(describing: TrackHeader.self)
        collectionView.register(UINib(nibName: identifier, bundle: nil), forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: identifier)
    }
    
    private func registerCell() {
        let identifier = String(describing: TrackCell.self)
        collectionView.register(UINib(nibName: identifier, bundle: nil), forCellWithReuseIdentifier: identifier)
    }
    
    private func setTracks(_ tracks: [TrackModel]?) {
        DispatchQueue.main.async {
            guard let tracks = tracks else { return }
            self.tracks = tracks
            self.collectionView.reloadData()
        }
    }
}

extension HomeViewController: TrackCellDelegate {
    
    func didSelectCard(movie: MovieModel) {
        let detailViewController = DetailViewController(movie: movie)
        self.navigationController?.present(detailViewController, animated: true, completion: nil)
    }
}

extension HomeViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return tracks.count
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let trackCell =  collectionView.dequeueReusableCell(withReuseIdentifier: String(describing: TrackCell.self), for: indexPath) as! TrackCell
        if let track = tracks[safeIndex: indexPath.section] {
            trackCell.setup(movies: track.movies, delegate: self)
        }
        return trackCell
    }
}


extension HomeViewController: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let verticalSpace: CGFloat = 16 * 2
        let width = collectionView.frame.width
        let height = CardCell.getSize(for: collectionView.frame.width).height + verticalSpace
        return CGSize(width: width, height: height)
    }
    
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        
        let header = collectionView.dequeueReusableSupplementaryView(ofKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: String(describing: TrackHeader.self), for: indexPath) as! TrackHeader
        
        if let track = tracks[safeIndex: indexPath.section] {
            header.setup(title: track.title)
        }
        
        return header
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
        let width = collectionView.frame.width
        let height = width * (UIDevice.isTV() ? 0.05 : 0.1)
        return CGSize(width: width, height: height)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 0, left: 0, bottom: 8, right: 0)
    }
}
