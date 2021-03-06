//
//  MovieDetailViewController.swift
//  My Movies
//
//  Created by karim metawea on 5/12/19.
//  Copyright © 2019 KarimMetawea. All rights reserved.
//

import UIKit

class MovieDetailViewController: UIViewController {
    
    @IBOutlet weak var movieImageView:UIImageView!
    @IBOutlet weak var ratingLabel: UILabel!
    @IBOutlet weak var favouriteButton: UIButton!
    @IBOutlet weak var addToWatchListButton: UIButton!
    @IBOutlet weak var movieNameLabel: UILabel!
    @IBOutlet weak var movieInfoLabel: UILabel!
    
    var movie:Movie?
    var inWatchList:Bool{
        return MovieModel.watchlist.contains(where: { (movie) -> Bool in
            movie.id == self.movie?.id
        })
    }
    var inFavoritesList:Bool{
        return MovieModel.favorites.contains(where: { (movie) -> Bool in
            movie.id == self.movie?.id
        })
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do anydditional setup after loading the view.
        movieImageView.kf.setImage(with: TMDBClient.Endpoints.posterImage(movie!.posterPath ?? "").url)
        movieNameLabel.text = movie?.title
        movieInfoLabel.text = movie?.overview
        ratingLabel.text = movie?.voteAverage.description
        
        
        toggleButton(addToWatchListButton, enabled: inWatchList)
        toggleButton(favouriteButton, enabled: inFavoritesList)
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
       
        
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
    @IBAction func addToWatchList(_ sender: Any) {
        TMDBClient.markWatchlist(movieId: movie!.id, watchlist: !inWatchList, completion: handleWatchlistResponse(success:error:))
        
    }
    @IBAction func favoriteMovie(_ sender: Any) {
        TMDBClient.markFavorite(movieId: movie!.id, favorite: !inFavoritesList, completion: handleFavoriteResponse(success:error:))
    }
    func handleWatchlistResponse(success: Bool, error: Error?) {

        if success {
            if inWatchList {
                print("before delete: \(MovieModel.watchlist.count)")
                MovieModel.watchlist = MovieModel.watchlist.filter() {$0 != movie}
                print("after delete: \(MovieModel.watchlist.count)")
                self.toggleButton(self.addToWatchListButton, enabled: inWatchList)
            } else {
                MovieModel.watchlist.append(movie!)
            }
            

        }
    }
    
    func handleFavoriteResponse(success: Bool, error: Error?) {

        if success {
            if inFavoritesList {
                MovieModel.favorites = MovieModel.favorites.filter() {$0 != movie}
                self.toggleButton(self.favouriteButton, enabled: inFavoritesList )

            } else {
                MovieModel.favorites.append(movie!)
            }
            
            
        }
    }
    
    
    
    func toggleButton(_ button: UIButton, enabled: Bool) {
        if enabled {
            button.tintColor = Theme.tintColor 
        } else {
            button.tintColor = #colorLiteral(red: 0.1019607857, green: 0.2784313858, blue: 0.400000006, alpha: 1)
        }
    }
}
