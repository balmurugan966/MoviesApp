//
//  DiscoverActions.swift
//  MoviesApp
//
//  Created by Balamurugan on 25/01/2022.
//

import UIKit
import iOSUtilities
import Entities

// MARK: DiscoverViewModel Delegate
extension DiscoverViewController: DiscoverViewModelDelegate {
    //Move to next screen after fetching single movie
    func fetchSingleMovieSuccess(_ movie: Movie) {
        
        appCoordinator?.moveToMovieDetail(viewModel: viewModel)
        viewModel.detaildelegate?.sendMovieDetail(data: movie)
    }
    
    //Show Error if any
    func sendError(error: String) {
        simpleAlert(title: error)
    }
    
    func discoverViewModel(_ viewModel: DiscoverViewModel, didLoad data: [MovieCell.ViewModel]) {
        cellData = data
    }
}

// MARK:- CollectionView Delegate
extension DiscoverViewController:UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didHighlightItemAt indexPath: IndexPath) {
        guard let cell = collectionView.cellForItem(at: indexPath) else {return}
        
        //Animate Cell
        animateView {
            cell.transform = .init(scaleX: 0.9, y: 0.9)
        } completedaction: {
            print("do nothing")
        }
        
    }
    
    func collectionView(_ collectionView: UICollectionView, didUnhighlightItemAt indexPath: IndexPath) {
        
        guard let cell = collectionView.cellForItem(at: indexPath) else {return}
        
        //Animate Cell
        animateView {
            cell.transform = .identity
        } completedaction: {
            print("do nothing")
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        guard let item = dataSource.itemIdentifier(for: indexPath) else {return}
        viewModel.getSingleMovie(imdbId: item.id)
    }
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        
        if(self.contentView.collectionView.contentOffset.y >= (self.contentView.collectionView.contentSize.height - self.contentView.collectionView.bounds.size.height)) {
            
            viewModel.addPagination(page: viewModel.paginationHandler.currentPage)
            
        }
        
    }
    
}

// MARK: UISearchBar Delegate
extension DiscoverViewController: UISearchBarDelegate {
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        
        //This is done to ensure the api call do not trigger on every textchange, this approach drive effieciency
        //learnt from RxSwift Debounce
        let debouncedFunc = debounce(interval: 2000, queue: .main) { [weak self] in
            
            if searchText != "" {
                self?.viewModel.queryMovie(query: searchText)
                self?.viewModel.movieName = searchText
            } else {
                self?.viewModel.viewDidLoad()
            }
            
        }
        debouncedFunc()
    }
    func searchBarSearchButtonClicked( _ searchBar: UISearchBar) {
        print("sdsc")
        searchBar.resignFirstResponder()
    }
    
}

