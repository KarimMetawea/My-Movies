//
//  MovieCell.swift
//  My Movies
//
//  Created by karim metawea on 5/11/19.
//  Copyright © 2019 KarimMetawea. All rights reserved.
//

import UIKit
import Kingfisher

class MovieCell: UICollectionViewCell {
    
    
    @IBOutlet weak var movieImageView: UIImageView!
    
    @IBOutlet weak var movieNameLabel: UILabel!
    
    
    
    
    
    func configureCell(movie:Movie){
        movieImageView.kf.setImage(with: TMDBClient.Endpoints.posterImage(movie.posterPath ?? "").url)
        movieNameLabel.text = movie.title
    }
    
}
