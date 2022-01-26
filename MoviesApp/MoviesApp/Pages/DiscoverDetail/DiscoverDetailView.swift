//
//  DiscoverDetailView.swift
//  MoviesApp
//
//  Created by Balamurugan on 25/01/2022.
//

import UIKit
import iOSUtilities

final class DiscoverDetailView: UIView {
    
    let collectionView: UICollectionView = {
        let itemSize = NSCollectionLayoutSize(
            widthDimension: .estimated(200),
            heightDimension: .fractionalHeight(1.0))
        let itemLayout = NSCollectionLayoutItem(layoutSize: itemSize)
        itemLayout.contentInsets = .init(top: 0, leading: 0, bottom: 0, trailing: CGFloat.margin2x)
        
        let groupSize = NSCollectionLayoutSize(
            widthDimension: .fractionalWidth(1.0),
            heightDimension: .absolute(CGFloat.size35))
        
        let groupLayout = NSCollectionLayoutGroup.horizontal(
            layoutSize: groupSize,
            subitem: itemLayout,
            count: 2)

        groupLayout.interItemSpacing = .fixed(8)
        
        let section = NSCollectionLayoutSection(group: groupLayout)
        section.contentInsets = .init(top: 0, leading: 0, bottom: 0, trailing: 16)
        section.interGroupSpacing = 8
        
        let layout = UICollectionViewCompositionalLayout(section: section)
        let this = UICollectionView(frame: .zero, collectionViewLayout: layout)
        this.backgroundColor = .clear
        return this
    }()
    
    lazy var discoverDetailHeaderViewOne = DiscoverDetailHeaderView()
    lazy var discoverDetailHeaderViewTwo = DiscoverDetailHeaderViewTwo()
    lazy var discoverDetailBodyView = DiscoverDetailBodyView()
    
    let mainView: UIView = {
        let view = UIView()
        return view
    }()
    
     let scrollView: UIScrollView = {
        let scrollView = UIScrollView()
         scrollView.backgroundColor = .black
        return scrollView
    }()
  
    convenience init() {
        self.init(frame: .zero)
        configureView()
        configureSubviews()
        configureConstraints()
    }

    private func configureView() {
        backgroundColor = .movieBackgroundColor
    }

    private func configureSubviews() {
        addSubview(scrollView)
        scrollView.addSubview(mainView)
        mainView.addSubview(discoverDetailHeaderViewOne.posterImage)
        mainView.addSubview(discoverDetailHeaderViewOne.titleLabel)
        mainView.addSubview(discoverDetailHeaderViewOne.ratingLabel)
        mainView.addSubview(discoverDetailHeaderViewOne.ratingImage)
        mainView.addSubview(discoverDetailHeaderViewOne.directorLabel)
        mainView.addSubview(discoverDetailHeaderViewOne.lineView)
        mainView.addSubview(discoverDetailHeaderViewTwo.fourKView)
        mainView.addSubview(discoverDetailHeaderViewTwo.fourKLabel)
        mainView.addSubview(discoverDetailHeaderViewTwo.releaseDateLabel)
        mainView.addSubview(discoverDetailHeaderViewTwo.releaseDateText)
        mainView.addSubview(discoverDetailBodyView.genreLabel)
        mainView.addSubview(collectionView)
        mainView.addSubview(discoverDetailBodyView.lineViewTwo)
        mainView.addSubview(discoverDetailBodyView.synopsisLabel)
        mainView.addSubview(discoverDetailBodyView.synopsisText)
    }

}

