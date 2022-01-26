//
//  DiscoverViewModel.swift
//  MoviesApp
//
//  Created by Balamurugan on 25/01/2022.
//

import Entities
import API
import iOSUtilities

protocol DiscoverViewModelDelegate: AnyObject {
    func discoverViewModel(_ viewModel: DiscoverViewModel, didLoad data: [MovieCell.ViewModel])
    func fetchSingleMovieSuccess(_ movie:Movie)
    func sendError(error:String)
}

final class DiscoverViewModel {
    
    //MARK:- Properties
    weak var delegate: DiscoverViewModelDelegate?
    var detaildelegate: DiscoverDetailDelegate?
    var movieName: String = "Marvel"
   
    var paginationHandler = PaginationHandler()
    private let session: Session
    private var duplicateMoviesList = [Movie]()
    private var movies: [Movie] = [] {
        didSet {
            delegate?.discoverViewModel(self, didLoad: movies.map { movie in
                return MovieCell.ViewModel(
                    id: movie.id.isNil(value: ""),
                    title: movie.title.isNil(value: ""),
                    image:movie.poster_path.isNil(value: ""),
                    year: movie.year.isNil(value: ""),
                    uuid: movie.uuid.uuidString
                )
            })
        }
    }
    private var fetchedMovie:Movie?
    
    init(session: Session) {
        self.session = session
    }

    func viewDidLoad() {
        //Fetch Batman Movies to be displayed on the home page
        paginationHandler.reset()
        print("movieName",movieName)
        Movie.getNowPlaying(page: "1",movieName).response(using: session.client) { [weak self] response in
            
            DispatchQueue.main.async {
                
                switch response{
                case .success(let data):
                    
                    self?.movies =  data.search ?? []
                    self?.duplicateMoviesList = data.search ?? []
                    
                case .failure(let error):
                    
                    self?.delegate?.sendError(error: error.errorDescription.isNil(value: ""))
                }
            }
        }
    }
    
    func addPagination(page: Int) {
        print("movieName addPagination",movieName)
        guard paginationHandler.canFetchMore() else { return }
        Movie.getNowPlaying(page: "\(page)", movieName).response(using: session.client) { [weak self] response in
            
            DispatchQueue.main.async {
                
                switch response{
                case .success(let data):
                    
                   
                    let resultSearch = data.search ?? []
                    resultSearch.forEach { fetched in
                        if !(self?.duplicateMoviesList.contains(where: { transaction -> Bool in
                            fetched == transaction
                        }) ?? false) {
                            // add only unique transactions, in case multiple requests have been made
                            self?.duplicateMoviesList.append(fetched)
                        }
                    }
                    
                    self?.movies = self?.duplicateMoviesList ?? []
                  
                    self?.paginationHandler.totalItemsReceived(resultSearch.count)
                case .failure(let error):
                    
                    self?.delegate?.sendError(error: error.errorDescription.isNil(value: ""))
                }
            }
        }
    }
    
    //Search for movies
    func queryMovie(query:String) {
        print("movieName queryMovie",movieName)
        Movie.queryMovie(query: query).response(using: session.client) { [weak self] response in
            
            DispatchQueue.main.async {
                self?.movieName = query
                switch response{
                    
                case .success(let data):
                   
                    self?.movies =  data.search ?? []
                                                        
                    
                case .failure(let error):
                 
                    self?.delegate?.sendError(error: error.errorDescription.isNil(value: ""))
                }
                
            }
        }
    }
    
    //Fetch a single movie
    func getSingleMovie(imdbId:String) {
        Movie.getMovie(query: imdbId).response(using: session.client) { [weak self] response in
            DispatchQueue.main.async {
                switch response {
                case .success(let data):
                    self?.fetchedMovie =  data
                    self?.delegate?.fetchSingleMovieSuccess(data)
                case .failure(let error):
                    self?.delegate?.sendError(error: error.errorDescription.isNil(value: ""))
                }
                
            }
        }
    }
    
    //Send Fetched Movie
    func sendMovieDetail() {

        let movie = fetchedMovie
        detaildelegate?.sendMovieDetail(data: movie)
    }
    
    //Get Movie ID
    func getSelectedMovieId(cell:MovieCell.ViewModel) -> String?{
        
        return movies.filter{ $0.id == cell.id }.first?.id
    }
}
