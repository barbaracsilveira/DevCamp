//
//  DetailViewController.swift
//  DevCamp
//
//  Created by Bárbara Carvalho Silveira on 29/07/19.
//  Copyright © 2019 Bárbara Carvalho Silveira. All rights reserved.
//

import UIKit

final class DetailViewController: UIViewController {
    
    @IBOutlet private weak var titleLabel: UILabel!
    @IBOutlet private weak var durationLabel: UILabel?
    @IBOutlet private weak var synopsisLabel: UILabel?
    @IBOutlet private weak var thumbImage: UIImageView!
    @IBOutlet private weak var gradientView: UIView!
    
    private let movie: MovieModel
    
    init(movie: MovieModel) {
        self.movie = movie
        super.init(nibName: String(describing: DetailViewController.self), bundle: nil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        titleLabel.text = movie.title
        durationLabel?.text = movie.duration
        synopsisLabel?.text = movie.synopsis
        thumbImage.sd_setImage(with: URL(string: movie.thumbImage), completed: nil)
        setGradientBackground()
    }
    
    private func setGradientBackground() {
        
        let gradientLayer = CAGradientLayer()
        gradientLayer.frame = self.gradientView.bounds
        
        if UIDevice.isTV() {
            gradientLayer.colors = [UIColor.clear.cgColor, UIColor.black.cgColor]
            gradientLayer.startPoint = CGPoint(x: 1.0, y: 0.5)
            gradientLayer.endPoint = CGPoint(x: 0, y: 0.5)
        } else {
            gradientLayer.colors = [UIColor.clear.cgColor, UIColor.themeBlue.cgColor]
        }
        self.gradientView.layer.addSublayer(gradientLayer)
    }
}
