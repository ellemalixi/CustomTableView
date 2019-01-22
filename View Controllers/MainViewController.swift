//
//  MainViewController.swift
//  CustomTableView
//
//  Created by Michelle M on 18/11/2018.
//  Copyright © 2018 batgirl. All rights reserved.
//

import UIKit

class MainViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var dataTable: UITableView!

    static let nibName = "MainViewController"
    var dataArray: [MoviesFormatted] = [MoviesFormatted]()
    
    let dummyJSON = """
{"Search":[{"Title":"Harry Potter and the Deathly Hallows: Part 2","Year":"2011","imdbID":"tt1201607","movieType":"movie","Poster":"https://m.media-amazon.com/images/M/MV5BMjIyZGU4YzUtNDkzYi00ZDRhLTljYzctYTMxMDQ4M2E0Y2YxXkEyXkFqcGdeQXVyNTIzOTk5ODM@._V1_SX300.jpg"},{"Title":"Harry Potter and the Sorcerer's Stone","Year":"2001","imdbID":"tt0241527","movieType":"movie","Poster":"https://m.media-amazon.com/images/M/MV5BNjQ3NWNlNmQtMTE5ZS00MDdmLTlkZjUtZTBlM2UxMGFiMTU3XkEyXkFqcGdeQXVyNjUwNzk3NDc@._V1_SX300.jpg"},{"Title":"Harry Potter and the Chamber of Secrets","Year":"2002","imdbID":"tt0295297","movieType":"movie","Poster":"https://m.media-amazon.com/images/M/MV5BMTcxODgwMDkxNV5BMl5BanBnXkFtZTYwMDk2MDg3._V1_SX300.jpg"},{"Title":"Harry Potter and the Prisoner of Azkaban","Year":"2004","imdbID":"tt0304141","movieType":"movie","Poster":"https://m.media-amazon.com/images/M/MV5BMTY4NTIwODg0N15BMl5BanBnXkFtZTcwOTc0MjEzMw@@._V1_SX300.jpg"},{"Title":"Harry Potter and the Goblet of Fire","Year":"2005","imdbID":"tt0330373","movieType":"movie","Poster":"https://m.media-amazon.com/images/M/MV5BMTI1NDMyMjExOF5BMl5BanBnXkFtZTcwOTc4MjQzMQ@@._V1_SX300.jpg"},{"Title":"Harry Potter and the Order of the Phoenix","Year":"2007","imdbID":"tt0373889","movieType":"movie","Poster":"https://m.media-amazon.com/images/M/MV5BMTM0NTczMTUzOV5BMl5BanBnXkFtZTYwMzIxNTg3._V1_SX300.jpg"},{"Title":"Harry Potter and the Deathly Hallows: Part 1","Year":"2010","imdbID":"tt0926084","movieType":"movie","Poster":"https://m.media-amazon.com/images/M/MV5BMTQ2OTE1Mjk0N15BMl5BanBnXkFtZTcwODE3MDAwNA@@._V1_SX300.jpg"},{"Title":"Harry Potter and the Half-Blood Prince","Year":"2009","imdbID":"tt0417741","movieType":"movie","Poster":"https://m.media-amazon.com/images/M/MV5BNzU3NDg4NTAyNV5BMl5BanBnXkFtZTcwOTg2ODg1Mg@@._V1_SX300.jpg"},{"Title":"When Harry Met Sally...","Year":"1989","imdbID":"tt0098635","movieType":"movie","Poster":"https://m.media-amazon.com/images/M/MV5BMjE0ODEwNjM2NF5BMl5BanBnXkFtZTcwMjU2Mzg3NA@@._V1_SX300.jpg"},{"Title":"Dirty Harry","Year":"1971","imdbID":"tt0066999","movieType":"movie","Poster":"https://m.media-amazon.com/images/M/MV5BMzdhMTM2YTItOWU2YS00MTM0LTgyNDYtMDM1OWM3NzkzNTM2XkEyXkFqcGdeQXVyNjc1NTYyMjg@._V1_SX300.jpg"}],"totalResults":"618","Response":"True"}
"""
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.dataTable.register(UINib(nibName: "MovieTableViewCell", bundle: nil), forCellReuseIdentifier: "MovieCell")
        
        let jsonData: Data? = self.dummyJSON.data(using: .utf8)
        if let notNildata = jsonData {
            let tempData = try! JSONDecoder().decode(MoviesMain.self, from: notNildata)
            
            if let movieList = tempData.Search {
                for movie in movieList {
                    var movieFormatted: MoviesFormatted = MoviesFormatted(title: "", year: "", imdbID: "", movieType: "", poster: "")
                    
                    movieFormatted.title = movie?.Title ?? ""
                    movieFormatted.year = movie?.Year ?? ""
                    movieFormatted.movieType = movie?.movieType ?? ""
                    movieFormatted.poster = movie?.Poster ?? ""
                    movieFormatted.imdbID = movie?.imdbID ?? ""
                    
                    self.dataArray.append(movieFormatted)
                }
            }
        }
        
        self.dataTable.rowHeight = 240
    }

    // MARK: - UITableViewDataSource
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.dataArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let tempMovieFormatted: MoviesFormatted = self.dataArray[indexPath.row] // getting position/row
        
        let cell: MovieTableViewCell = tableView.dequeueReusableCell(withIdentifier: "MovieCell", for: indexPath) as! MovieTableViewCell
        
        cell.configure(moviesFormatted: tempMovieFormatted)
        
        return cell
    }
    
    // MARK: - UITableViewDelegate
    
    func tableView(_ didSelectRowAttableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        
    }
    
}
